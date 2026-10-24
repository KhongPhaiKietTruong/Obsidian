dùng để tính [[Average Pooling]] với output mục tiêu được chỉ định mà không cần phải truyền tham số stride, kernel size, ... vào 
cú pháp
```python 
import torch.nn.function as T 

T.adaptive_average_pool1d(tensor_input, output_size)
```
với:
- tensor_input có hình dạng là (B, C, T) (T là số time_step)
ví dụ:
```python
a = torch.randn((32, 3, 16))
b = T.adaptive_average_pool1d(a, 8)
# a.shape = (32, 3, 16)
# b.shape = (32, 3, 8)
```