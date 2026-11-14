SE Block là thành phần cấu tạo nên [[SENet]], khối này giúp học được trọng số cho mỗi [[Feature Map]] ([[Channel Attention]]) 

```python
class SEBlock(nn.Module):
    def __init__(self, channels, reduction=16):
        super().__init__()

        # 1. Squeeze
        self.avg_pool = nn.AdaptiveAvgPool2d(1)

        # 2. Excitation
        self.fc = nn.Sequential(
            nn.Linear(channels, channels // reduction, bias=False),
            nn.ReLU(inplace=True),
            nn.Linear(channels // reduction, channels, bias=False),
            nn.Sigmoid()
        )

    def forward(self, x):
        # x: (B, C, H, W)
        b, c, h, w = x.shape
        # 1. Squeeze: (B, C, H, W) -> (B, C, 1, 1)
        y = self.avg_pool(x)
        # Flatten: (B, C, 1, 1) -> (B, C)
        y = y.view(b, c)
        # 2. Excitation: (B, C) -> (B, C)
        y = self.fc(y)
        # Reshape: (B, C) -> (B, C, 1, 1)
        y = y.view(b, c, 1, 1)
        # 3. Scale: channel-wise multiplication
        return x * y

```
![[Pasted image 20261106203740.png]]