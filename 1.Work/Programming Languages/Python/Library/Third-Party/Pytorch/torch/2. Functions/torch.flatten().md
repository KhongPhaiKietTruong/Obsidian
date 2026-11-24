## Định Nghĩa
torch.flatten() dùng để làm "phẳng" một [[Tensor]] nhiều chiều thành một tensor ít chiều hơn 
cú pháp:
```python
torch.flatten(input, start_dim=0, end_dim=-1)
```
với:
- input: tensor đầu vào 
- start_dim: vị trí bắt đầu làm phẳng
- end_dim: vị trí kết thúc làm phẳng 

code ví dụ:
```python
a = torch.randn(2, 3, 4)
b = torch.flatten(a)
print(b.shape) # (24,)


```