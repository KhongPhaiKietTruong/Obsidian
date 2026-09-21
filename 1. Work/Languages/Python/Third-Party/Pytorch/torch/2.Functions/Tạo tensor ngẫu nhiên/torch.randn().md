sử dụng hàm randn(a, b, c, ...) với a, b, c, ... và kích thước của từng chiều
dùng để tạo [[Tensor]] có giá trị ngẫu nhiên tuân theo [[Normal distribution (Gaussian distribution)]] trong khoảng \[0, 1)

```python 
random_tensor = torch.randn((3, 3))
print(random_tensor)

"""
tensor([[-0.6387, -1.8116,  0.2118],
        [-2.2273,  0.7991,  1.6277],
        [-1.4349,  0.1077, -0.0623]])
"""
```