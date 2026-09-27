dùng để tạo một lớp [[1. Work/Theory/Machine Learning/Deep learning/Computer Vision/Layers/Convolution Layer|Convolution Layer]] 
```python
nn.Conv2d(
	in_channels=3,
    out_channels=16,
    kernel_size=3,
    stride=1,
    padding=1
)
```
với:
- in_channels: là số lớp nhận vào (sẽ bằng với out_channels của lớp trước)
- out_channels: số lượng [[Filter]] 
- kernel_size: kích thước [[Filter]] 
- ... 