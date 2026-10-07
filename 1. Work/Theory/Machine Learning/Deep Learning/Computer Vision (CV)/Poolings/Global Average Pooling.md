## Định nghĩa
là [[Average Pooling]] với pool size = [[Feature Map F]]'s [[Spatial Size]] 
cho ra ma trận với kích thước 1x1

## Tác dụng
- dùng để giảm số lượng tham số trước khi truyền vào [[Fully Connected Layer (FC)]] 
## Sử dụng
- sử dụng làm lớp ngay trước lớp FC 
## Code 
```python
nn.AdaptiveAvgPool2d((1, 1))
```
