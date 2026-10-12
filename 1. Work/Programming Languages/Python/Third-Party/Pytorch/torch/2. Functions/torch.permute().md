
```python
a = torch.rand((67, 122, 244))
b = a.permute(1, 2, 0)
b.shape

#output:
# torch.Size([122, 244, 67])
```