dùng để tìm ra giá trị lớn nhất trong mỗi chiều so với một chiều chỉ định, trả về một [[Tuple]] (value, index)
```python
x = torch.tensor([[1.0, 5.0, 3.0], 
                  [4.0, 2.0, 8.0]])  # Shape: (2, 3)

# Tìm theo dim=1 (ngang theo hàng, tìm cột có giá trị lớn nhất)
values, indices = torch.max(x, dim=1)

print(values)   # tensor([5., 8.])
print(indices)  # tensor([1, 2]) (vị trí tương ứng ở mỗi hàng)
```