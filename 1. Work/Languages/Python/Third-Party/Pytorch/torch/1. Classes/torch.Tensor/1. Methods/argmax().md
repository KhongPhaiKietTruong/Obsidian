cú pháp:
```python
a = torch.Tensor([[1, 2, 3],[6, 5, 4], [2, 9, 1]])
a.argmax(dim=1)
# output
# tensor([2, 0, 1])
```
dùng để trả về một [[Tensor]] chứa các giá trị là vị trí của giá trị lớn nhất của mỗi hàng (dim=1) hoặc mỗi cột (dim=0) 
