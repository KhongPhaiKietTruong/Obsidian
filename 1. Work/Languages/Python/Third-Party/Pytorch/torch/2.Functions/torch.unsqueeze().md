dùng để thêm 1 chiều dữ liệu vào [[Tensor]] ở vị trí chỉ địng 
```python
torch.unsqueeze(<pos>)
```

```python
a = torch.rand((2, 4))
b = a.unsqueeze(1)
print(b.shape)

# output:
# torch.Size([2, 1, 4])
```