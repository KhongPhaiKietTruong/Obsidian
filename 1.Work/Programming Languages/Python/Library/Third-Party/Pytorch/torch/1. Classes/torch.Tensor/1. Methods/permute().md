dùng để sắp xếp lại các chiều của [[Tensor]]
```python
a = torch.randn(244, 244, 3)
b = a.permute(2, 0, 1)
print(a.shape, b.shape)
```
output:
```
torch.Size([244, 244, 3]) torch.Size([3, 244, 244])
```
