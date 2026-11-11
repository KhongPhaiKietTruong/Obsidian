## Định nghĩa
GAP là [[Average Pooling]] với pool size = [[Spatial Size]] của [[Feature Map]], output sẽ là một feature map có spatial size bằng 1 
ví dụ: (32, 512, 244, 244) -> GAP -> (32, 512, 1, 1)
## Tác dụng
- dùng để giảm số lượng tham số trước khi truyền vào [[FC - Fully Connected Layer]] 
## Sử dụng
- sử dụng làm lớp ngay trước lớp FC 
## Code 
```python
nn.AdaptiveAvgPool2d((1, 1))
```
