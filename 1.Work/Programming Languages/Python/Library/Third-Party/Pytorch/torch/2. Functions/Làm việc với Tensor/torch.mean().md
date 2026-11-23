dùng để tính trung bình một tensor theo chiều chỉ định 
```python
torch.mean(tensor)
```
ví dụ:
```python
x = torch.tensor([[1.0, 2.0, 3.0], 
                  [4.0, 5.0, 6.0]])  # Shape: (2, 3)

# dim=None (tính tổng tất cả phần tử của tensor):
res = torch.mean(x) 
print(res) # tensor(3.5000)

# dim=0 (tính dọc theo các hàng, gom các hàng lại):
mean_col = torch.mean(x, dim=0)
print(mean_col)  # tensor([2.5000, 3.5000, 4.5000]), Shape: (3,)

# dim=1 (tính ngang theo các cột, gom các cột lại):
mean_row = torch.mean(x, dim=1)
print(mean_row)  # tensor([2., 5.]), Shape: (2,)
```