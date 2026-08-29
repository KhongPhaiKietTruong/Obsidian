dùng để thêm một chiều dữ liệu vào [[Tensor]]
```python
a = torch.rand((2, 4))
b = a.unsqueeze(1)
print(b.shape)

# output:
# torch.Size([2, 1, 4])
```