temporal head 
temporal transformer 
balanced sampler 
~~weighted~~ 
cross-entropy / focal loss 
~~attention pooling~~ 
swin transformer 
transformer encoder 
DeiT 
~~label smoothing~~ 
test-time augmentation:
- torch.flip
Tensor.sigmoid()
~~AdamW + CosineAnnealingLR~~
~~Tăng tốc độ bằng Mixed Precision (AMP)~~ 
~~temporal poolings~~ 
ensemble architecture 
layer-wise learning rate 
backbone freezing (ở 1-2 epoch đầu)
logit-adjustment 
model checkpoint averaging 
~~TPP là gì~~ 
cutmix, mixup (collate_fn)
tìm hiểu cách dùng các model như convnext, shufflenet, ... 
Squeeze-and-Excitation
.reset_index(drop=True)
## Arcitecture 
### CNN 
ConvNeXt, EfficientNet, 
### Vision Transformer
ViT, Swin DeiT 
## Detection :
faster R-CNN 
cascade R-CNN 
DETR 
focal loss, CIoU loss, GIoU loss 
WBF (Weighted Boxes Fusion) hoặc Soft-NMS
## Segmentation 
U-Net, Mask R-CNN 
BCE loss, Dice Loss, Focal Tversky Loss


### SE block 
```
import torch
import torch.nn as nn

class SimpleCNN(nn.Module):
    def __init__(self, num_classes=5, in_ch=3):
        super().__init__()

        self.conv1 = nn.Sequential(
            nn.Conv2d(in_ch, 32, kernel_size=3, padding=1, bias=False),
            nn.BatchNorm2d(32),
            nn.ReLU(inplace=True),
            nn.MaxPool2d(2)
        )

        # Thêm module SE Attention (32 channels -> bottleneck 8 channels)
        self.se1 = nn.Sequential(
            nn.AdaptiveAvgPool2d(1),
            nn.Flatten(),
            nn.Linear(32, 8, bias=False),
            nn.ReLU(inplace=True),
            nn.Linear(8, 32, bias=False),
            nn.Sigmoid()
        )

        self.conv2 = nn.Sequential(
            nn.Conv2d(32, 64, kernel_size=3, padding=1, bias=False),
            nn.BatchNorm2d(64),
            nn.ReLU(inplace=True)
        )

        # Thêm module SE Attention (64 channels -> bottleneck 16 channels)
        self.se2 = nn.Sequential(
            nn.AdaptiveAvgPool2d(1),
            nn.Flatten(),
            nn.Linear(64, 16, bias=False),
            nn.ReLU(inplace=True),
            nn.Linear(16, 64, bias=False),
            nn.Sigmoid()
        )

        self.gap = nn.AdaptiveAvgPool2d(1)
        self.fc = nn.Linear(64, num_classes)

    def forward(self, x):
        x = self.conv1(x)
        x = x * self.se1(x)[:, :, None, None]  # Nhân trọng số attention (B, 32, 1, 1)

        x = self.conv2(x)
        x = x * self.se2(x)[:, :, None, None]  # Nhân trọng số attention (B, 64, 1, 1)

        x = self.gap(x).flatten(1)
        x = self.fc(x)
        return x
```