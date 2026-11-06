```python
# Import required libraries
import os
import pickle
import numpy as np
import torch
import torch.nn as nn
import torch.nn.functional as F
import cv2
import csv
from torchvision import models
from torch.utils.data import Dataset, DataLoader, random_split
from torch.optim import AdamW
from sklearn.metrics import precision_recall_fscore_support
from tqdm import tqdm

import warnings
warnings.filterwarnings('ignore')

os.environ["TORCH_HOME"] = '/opt/torch_models'

# Constants
NUM_CLASSES = 100
TARGET_FRAMES = 16  # number of frames per video
```


```python
# Read video frames using OpenCV
def read_video(video_path):
    cap = cv2.VideoCapture(video_path)
    frames = []
    while True:
        ret, frame = cap.read()

        if not ret:
            break
        frame = cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)
        frames.append(frame)
    cap.release()
    if len(frames) == 0:
        raise ValueError(f"Could not read any frames from {video_path}")
    frames = torch.from_numpy(np.stack(frames, axis=0))
    return frames


# Custom collate function for batching
def collate_fn(batch):
    frames = torch.stack([item['frames'] for item in batch])
    labels = torch.tensor([item['label_idx'] for item in batch])
    label_names = [item['label'] for item in batch]
    return {'frames': frames, 'label_idx': labels, 'label': label_names}
```


```python
# Define video dataset
class VideoDataset(Dataset):
    def __init__(self, root_dir, label_to_idx_path, transform=None,
                 mean=[0.485, 0.456, 0.406], std=[0.229, 0.224, 0.225],
                 target_frames=32):
        self.root_dir = root_dir
        self.transform = transform
        self.mean, self.std = mean, std
        self.target_frames = target_frames
        self.instances, self.labels, self.label_idx = [], [], []

        with open(label_to_idx_path, 'rb') as f:
            self.label_mapping = pickle.load(f)

        for label_folder in sorted(os.listdir(root_dir))[:NUM_CLASSES]:
            path = os.path.join(root_dir, label_folder)
            if os.path.isdir(path):
                for video_file in os.listdir(path):
                    video_path = os.path.join(path, video_file)
                    self.instances.append(video_path)
                    self.labels.append(label_folder)
                    self.label_idx.append(self.label_mapping[label_folder])

    # Downsample frames to fixed length
    def _downsample_frames(self, frames):
        num_frames = frames.shape[0]
        if num_frames == self.target_frames:
            return frames
        elif num_frames < self.target_frames:
            pad = self.target_frames - num_frames
            return torch.cat([frames, frames[-1:].repeat(pad, 1, 1, 1)], dim=0)
        else:
            idx = torch.linspace(0, num_frames - 1, self.target_frames).long()
            return frames[idx]

    # Normalize frames with ImageNet stats
    def _normalize(self, frames):
        frames = frames.permute(0, 3, 1, 2).float() / 255.0
        mean = torch.tensor(self.mean).view(1, 3, 1, 1)
        std = torch.tensor(self.std).view(1, 3, 1, 1)
        return (frames - mean) / std

    def __len__(self):
        return len(self.instances)

    def __getitem__(self, idx):
        video_path = self.instances[idx]
        label, label_idx = self.labels[idx], self.label_idx[idx]
        frames = read_video(video_path)
        frames = self._downsample_frames(frames)
        frames = self._normalize(frames)
        return {"frames": frames, "label_idx": label_idx, "label": label}
```


```python
# Define CRNN model
class CRNN(nn.Module):
    def __init__(self, num_classes=100, hidden_size=256, resnet_pretrained_weights=None):
        super(CRNN, self).__init__()
        resnet = models.resnet18(weights=resnet_pretrained_weights)
        self.cnn = nn.Sequential(*list(resnet.children())[:-2])
        self.feature_dim = 512
        self.pool = nn.AdaptiveAvgPool2d((1, 1))
        self.rnn = nn.LSTM(self.feature_dim, hidden_size, batch_first=True, dropout=0.3)
        self.fc = nn.Linear(hidden_size, num_classes)

    def forward(self, x):
        B, T, C, H, W = x.size()
        x = x.view(B * T, C, H, W)
        features = self.cnn(x)
        pooled = self.pool(features).squeeze(-1).squeeze(-1)
        seq = pooled.view(B, T, self.feature_dim)
        rnn_out, _ = self.rnn(seq)
        final = rnn_out[:, -1, :]
        return self.fc(final)
```


```python
# One training epoch
def train_epoch(model, dataloader, criterion, optimizer, device='cuda'):
    model.train()
    total_loss = 0
    progress = tqdm(dataloader, desc='Training')
    for batch in progress:
        frames, labels = batch['frames'].to(device), batch['label_idx'].to(device)
        optimizer.zero_grad()
        outputs = model(frames)
        loss = criterion(outputs, labels)
        loss.backward()
        optimizer.step()
        total_loss += loss.item()
        progress.set_postfix({'loss': f'{total_loss / (len(progress)+1e-9):.4f}'})
    return total_loss / len(dataloader)


# Validation
def validate(model, dataloader, criterion, device='cuda'):
    model.eval()
    total_loss, preds, labels_all = 0, [], []
    with torch.no_grad():
        for batch in tqdm(dataloader, desc='Validation'):
            frames, labels = batch['frames'].to(device), batch['label_idx'].to(device)
            outputs = model(frames)
            loss = criterion(outputs, labels)
            total_loss += loss.item()
            _, predicted = outputs.max(1)
            preds.extend(predicted.cpu().numpy())
            labels_all.extend(labels.cpu().numpy())
    precision, recall, f1, _ = precision_recall_fscore_support(labels_all, preds, average='macro', zero_division=0)
    return total_loss / len(dataloader), {'precision': precision*100, 'recall': recall*100, 'f1': f1*100}
```


```python
# Full training loop with validation and test evaluation
def train_model(model, train_loader, val_loader,
                num_epochs=10, lr=5e-4, device='cuda', save_path='best_model.pth'):
    model = model.to(device)
    criterion = nn.CrossEntropyLoss()
    optimizer = AdamW(model.parameters(), lr=lr, weight_decay=1e-4)
    scheduler = torch.optim.lr_scheduler.ReduceLROnPlateau(optimizer, 'min', factor=0.5, patience=3)

    best_f1 = 0.0
    for epoch in range(num_epochs):
        print(f"\n===== Epoch {epoch+1}/{num_epochs} =====")
        train_loss = train_epoch(model, train_loader, criterion, optimizer, device)
        val_loss, val_metrics = validate(model, val_loader, criterion, device)
        scheduler.step(val_loss)

        print(f"Val F1: {val_metrics['f1']:.2f}% | Precision: {val_metrics['precision']:.2f}% | Recall: {val_metrics['recall']:.2f}%")

        if val_metrics['f1'] > best_f1:
            best_f1 = val_metrics['f1']
            torch.save(model.state_dict(), save_path)
            print(f"✓ Best model saved with F1: {best_f1:.2f}%")
    return model
```


```python
# Training
model = CRNN(num_classes=NUM_CLASSES, hidden_size=256,
             resnet_pretrained_weights=models.ResNet18_Weights.IMAGENET1K_V1)

full_train = VideoDataset('dataset/train', 'dataset/label_mapping.pkl', target_frames=TARGET_FRAMES)
train_size = int(0.8 * len(full_train))
val_size = len(full_train) - train_size
train_dataset, val_dataset = random_split(full_train, [train_size, val_size], generator=torch.Generator().manual_seed(42))

train_loader = DataLoader(train_dataset, batch_size=32, shuffle=True, collate_fn=collate_fn, num_workers=128)
val_loader = DataLoader(val_dataset, batch_size=32, shuffle=False, collate_fn=collate_fn, num_workers=128)

print(f"Train: {len(train_dataset)}, Val: {len(val_dataset)}")

model = train_model(model, train_loader, val_loader,
                    num_epochs=20, lr=1e-4, device='cuda', save_path='best_model.pth')
```

    Train: 3100, Val: 775
    
    ===== Epoch 1/20 =====


    Training: 100%|██████████| 97/97 [00:21<00:00,  4.60it/s, loss=4.1440]
    Validation: 100%|██████████| 25/25 [00:05<00:00,  4.28it/s]


    Val F1: 15.63% | Precision: 26.37% | Recall: 17.33%
    ✓ Best model saved with F1: 15.63%
    
    ===== Epoch 2/20 =====


    Training: 100%|██████████| 97/97 [00:21<00:00,  4.50it/s, loss=2.9327]
    Validation: 100%|██████████| 25/25 [00:05<00:00,  4.42it/s]


    Val F1: 43.29% | Precision: 47.62% | Recall: 45.12%
    ✓ Best model saved with F1: 43.29%
    
    ===== Epoch 3/20 =====


    Training: 100%|██████████| 97/97 [00:22<00:00,  4.30it/s, loss=1.8699]
    Validation: 100%|██████████| 25/25 [00:07<00:00,  3.20it/s]


    Val F1: 56.43% | Precision: 59.38% | Recall: 58.49%
    ✓ Best model saved with F1: 56.43%
    
    ===== Epoch 4/20 =====


    Training: 100%|██████████| 97/97 [00:18<00:00,  5.11it/s, loss=1.1245]
    Validation: 100%|██████████| 25/25 [00:05<00:00,  4.31it/s]


    Val F1: 65.69% | Precision: 71.39% | Recall: 66.49%
    ✓ Best model saved with F1: 65.69%
    
    ===== Epoch 5/20 =====


    Training: 100%|██████████| 97/97 [00:24<00:00,  3.95it/s, loss=0.6970]
    Validation: 100%|██████████| 25/25 [00:05<00:00,  4.45it/s]


    Val F1: 68.45% | Precision: 71.87% | Recall: 68.82%
    ✓ Best model saved with F1: 68.45%
    
    ===== Epoch 6/20 =====


    Training: 100%|██████████| 97/97 [00:23<00:00,  4.07it/s, loss=0.4300]
    Validation: 100%|██████████| 25/25 [00:05<00:00,  4.38it/s]


    Val F1: 75.29% | Precision: 78.97% | Recall: 75.12%
    ✓ Best model saved with F1: 75.29%
    
    ===== Epoch 7/20 =====


    Training: 100%|██████████| 97/97 [00:19<00:00,  4.92it/s, loss=0.2700]
    Validation: 100%|██████████| 25/25 [00:05<00:00,  4.71it/s]


    Val F1: 78.42% | Precision: 82.16% | Recall: 77.78%
    ✓ Best model saved with F1: 78.42%
    
    ===== Epoch 8/20 =====


    Training: 100%|██████████| 97/97 [00:19<00:00,  4.94it/s, loss=0.1792]
    Validation: 100%|██████████| 25/25 [00:06<00:00,  3.93it/s]


    Val F1: 79.21% | Precision: 82.24% | Recall: 78.63%
    ✓ Best model saved with F1: 79.21%
    
    ===== Epoch 9/20 =====


    Training: 100%|██████████| 97/97 [00:21<00:00,  4.57it/s, loss=0.1272]
    Validation: 100%|██████████| 25/25 [00:05<00:00,  4.21it/s]


    Val F1: 81.97% | Precision: 83.62% | Recall: 81.99%
    ✓ Best model saved with F1: 81.97%
    
    ===== Epoch 10/20 =====


    Training: 100%|██████████| 97/97 [00:25<00:00,  3.86it/s, loss=0.0898]
    Validation: 100%|██████████| 25/25 [00:05<00:00,  4.19it/s]


    Val F1: 81.68% | Precision: 83.71% | Recall: 81.55%
    
    ===== Epoch 11/20 =====


    Training: 100%|██████████| 97/97 [00:21<00:00,  4.61it/s, loss=0.0653]
    Validation: 100%|██████████| 25/25 [00:06<00:00,  3.87it/s]


    Val F1: 81.55% | Precision: 83.23% | Recall: 81.72%
    
    ===== Epoch 12/20 =====


    Training: 100%|██████████| 97/97 [00:22<00:00,  4.41it/s, loss=0.0494]
    Validation: 100%|██████████| 25/25 [00:07<00:00,  3.56it/s]


    Val F1: 82.01% | Precision: 83.82% | Recall: 81.76%
    ✓ Best model saved with F1: 82.01%
    
    ===== Epoch 13/20 =====


    Training: 100%|██████████| 97/97 [00:24<00:00,  4.02it/s, loss=0.0410]
    Validation: 100%|██████████| 25/25 [00:07<00:00,  3.39it/s]


    Val F1: 80.88% | Precision: 82.45% | Recall: 81.06%
    
    ===== Epoch 14/20 =====


    Training: 100%|██████████| 97/97 [00:23<00:00,  4.10it/s, loss=0.0348]
    Validation: 100%|██████████| 25/25 [00:06<00:00,  3.92it/s]


    Val F1: 82.69% | Precision: 84.09% | Recall: 82.51%
    ✓ Best model saved with F1: 82.69%
    
    ===== Epoch 15/20 =====


    Training: 100%|██████████| 97/97 [00:20<00:00,  4.78it/s, loss=0.0300]
    Validation: 100%|██████████| 25/25 [00:06<00:00,  3.96it/s]


    Val F1: 81.82% | Precision: 83.32% | Recall: 81.86%
    
    ===== Epoch 16/20 =====


    Training: 100%|██████████| 97/97 [00:21<00:00,  4.49it/s, loss=0.0256]
    Validation: 100%|██████████| 25/25 [00:06<00:00,  3.75it/s]


    Val F1: 81.64% | Precision: 83.02% | Recall: 81.71%
    
    ===== Epoch 17/20 =====


    Training: 100%|██████████| 97/97 [00:19<00:00,  4.88it/s, loss=0.0218]
    Validation: 100%|██████████| 25/25 [00:05<00:00,  4.63it/s]


    Val F1: 81.29% | Precision: 82.59% | Recall: 81.38%
    
    ===== Epoch 18/20 =====


    Training: 100%|██████████| 97/97 [00:20<00:00,  4.67it/s, loss=0.0192]
    Validation: 100%|██████████| 25/25 [00:06<00:00,  3.80it/s]


    Val F1: 82.54% | Precision: 83.97% | Recall: 82.61%
    
    ===== Epoch 19/20 =====


    Training: 100%|██████████| 97/97 [00:26<00:00,  3.66it/s, loss=0.0170]
    Validation: 100%|██████████| 25/25 [00:06<00:00,  3.78it/s]


    Val F1: 81.41% | Precision: 82.98% | Recall: 81.56%
    
    ===== Epoch 20/20 =====


    Training: 100%|██████████| 97/97 [00:22<00:00,  4.37it/s, loss=0.0152]
    Validation: 100%|██████████| 25/25 [00:07<00:00,  3.33it/s]

    Val F1: 81.17% | Precision: 82.37% | Recall: 81.56%


    



```python
# Evaluate trained model on test set
def evaluate(model, folder_path, label_to_idx_path, output_csv="predictions.csv",
             device='cuda', model_path=None, target_frames=16):
    # Load trained weights if provided
    if model_path:
        model.load_state_dict(torch.load(model_path))
        print(f"Loaded model from {model_path}")

    model = model.to(device)
    model.eval()

    # Load label mapping
    with open(label_to_idx_path, 'rb') as f:
        label_mapping = pickle.load(f)
    idx_to_label = {v: k for k, v in label_mapping.items()}

    # Collect video files
    video_files = sorted([f for f in os.listdir(folder_path) if f.lower().endswith(('.mp4', '.avi', '.mov', '.mkv'))])
    print(f"Found {len(video_files)} videos in '{folder_path}'")

    predictions = []

    dataset = VideoDataset(
                  root_dir=folder_path,
                  label_to_idx_path=label_to_idx_path,
                  target_frames=target_frames
              )

    with torch.no_grad():
        for video_file in tqdm(video_files, desc="Predicting"):
            video_path = os.path.join(folder_path, video_file)
            try:
                # Read and preprocess video
                frames = read_video(video_path)
                frames = dataset._downsample_frames(frames)
                frames = dataset._normalize(frames)
                frames = frames.unsqueeze(0).to(device)  # (1, T, C, H, W)

                # Predict
                outputs = model(frames)
                _, predicted = outputs.max(1)
                label_idx = predicted.item()
                label_name = idx_to_label[label_idx]

                predictions.append((video_file, label_name))
            except Exception as e:
                print(f"Error processing {video_file}: {e}")

    # Save to CSV
    with open(output_csv, mode='w', newline='', encoding='utf-8') as f:
        writer = csv.writer(f)
        writer.writerow(['video_name', 'label'])
        writer.writerows(predictions)

    print(f"\nPredictions saved to '{output_csv}'")
    print(f"Total videos processed: {len(predictions)}")
```


```python
# Export public result
evaluate(
    model=model,
    folder_path="dataset/public_test",
    label_to_idx_path="dataset/label_mapping.pkl",
    model_path="best_model.pth",
    output_csv="public_submission.csv",
    device="cuda",
    target_frames=16
)

import zipfile

with zipfile.ZipFile("public_submission.zip", 'w', zipfile.ZIP_DEFLATED) as zipf:
        zipf.write("public_submission.csv")
        print("Created file public_submission.zip successfully.")
```

    Loaded model from best_model.pth
    Found 1630 videos in 'dataset/public_test'


    Predicting: 100%|██████████| 1630/1630 [02:42<00:00, 10.00it/s]


    
    Predictions saved to 'public_submission.csv'
    Total videos processed: 1630
    Created file public_submission.zip successfully.



```python
# Export private result
evaluate(
    model=model,
    folder_path="dataset/private_test",
    label_to_idx_path="dataset/label_mapping.pkl",
    model_path="best_model.pth",
    output_csv="private_submission.csv",
    device="cuda",
    target_frames=16
)

import zipfile

with zipfile.ZipFile("private_test.zip", 'w', zipfile.ZIP_DEFLATED) as zipf:
        zipf.write("private_submission.csv")
        print("Created file private_submission.zip successfully.")
```
