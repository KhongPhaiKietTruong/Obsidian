tham khảo thêm ở [[Batch Norm]]
ví dụ
```python
# Giả sử đầu vào là batch 8 ảnh RGB kích thước 32x32: (N, C, H, W)
x = torch.randn(8, 3, 32, 32)

# Khối Conv Block chuẩn: Conv2d -> BatchNorm2d -> ReLU
block = nn.Sequential(
    # Đặt bias=False vì BatchNorm2d đã có tham số bias (beta) riêng
    nn.Conv2d(in_channels=3, out_channels=64, kernel_size=3, padding=1, bias=False),
    nn.BatchNorm2d(num_features=64),  # num_features khớp với out_channels
    nn.ReLU(inplace=True)
)

out = block(x)
print("Output shape:", out.shape)  # torch.Size([8, 64, 32, 32])
```