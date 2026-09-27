dùng để khai báo một [[Fully Connected Layer (FC)]] mà không cần phải khai báo in_features vì nó sẽ tự động tính (chỉ sử dụng được khi kích thước input không đổi )
```python
self.classifier = nn.Sequential(
    nn.Flatten(),
    nn.LazyLinear(output_shape)
)
```
