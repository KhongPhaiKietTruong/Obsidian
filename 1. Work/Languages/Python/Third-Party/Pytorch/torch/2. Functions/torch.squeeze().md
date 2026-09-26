hàm này dùng để xóa các chiều không gian có kích thước = 1 
cú pháp:
```python
Tensor.squeeze(<dim>)
```
với dim là số thứ tự của chiều sẽ bị xóa (nếu chiều đó có kích thước = 1, nếu không phải 1 thì không làm gì cả, nếu bỏ trống dim thì xóa tất cả chiều)

```python
a = torch.rand((1, 3, 1, 4, 1, 1, 6))
# a.shape (1, 3, 1, 4, 1, 1, 6)
b = a.squeeze()
b.shape 

# outptut: torch.Size([3, 4, 6])
```

squeeze(-1) sẽ xóa chiều không gian cuối cùng chiề