```python
full_train = VideoDataset('dataset/train','/dataset/label_mapping.pkl', target_frames=TARGET_FRAMES, transform=train_transform)


train_indices, val_indices = train_test_split(torch.arange(len(full_train.labels)), test_size=0.2, random_state=42, stratify=full_train.label_idx)

train_dataset = Subset(full_train, train_indices)
val_dataset = Subset(full_val, val_indices)
```