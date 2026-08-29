hàm này dùng để xóa các chiều không gian có kích thước = 1 
```python
a = torch.rand((1, 3, 1, 4, 1, 1, 6))
# a.shape (1, 3, 1, 4, 1, 1, 6)
b = torch.squeeze(a)
b.shape 

# outptut: torch.Size([3, 4, 6])
```