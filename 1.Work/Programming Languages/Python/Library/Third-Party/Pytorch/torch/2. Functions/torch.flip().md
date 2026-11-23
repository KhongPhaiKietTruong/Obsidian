dùng để đảo ngược một [[Tensor]]
thường dùng để đảo ảnh trong [[Test Time Augmentation (TTA)]] 
```python
x = torch.tensor([
    [1, 2, 3],
    [4, 5, 6]
])

# Lật theo hàng (chiều dọc - Vertical Flip)
flip_v = torch.flip(x, dims=[0])
# tensor([[4, 5, 6],
#         [1, 2, 3]])

# Lật theo cột (chiều ngang - Horizontal Flip)
flip_h = torch.flip(x, dims=[1])
# tensor([[3, 2, 1],
#         [6, 5, 4]])

# Lật cả hai chiều cùng lúc
flip_both = torch.flip(x, dims=[0, 1])
# tensor([[6, 5, 4],
#         [3, 2, 1]])
```