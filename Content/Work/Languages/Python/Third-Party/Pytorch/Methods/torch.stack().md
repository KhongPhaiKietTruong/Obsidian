​	​	[[Method (Phương thức)]] này dùng để ghép các [[Tensor]] lại với nhau và tạo ra thêm một trục mới: 
```python
stack(list[tensor], dim)
```
với:
- dim là vị trí muốn tạo chiều mới

ví dụ:
```python
a = torch.tensor([1, 2, 3])
b = torch.tensor([4, 5, 6])

# a.shape = [3]
# b.shape = [3]

c = torch.stack([a, b], 0)
[3] + [3] (dim=0) -> c.shape = [2, 3]

c = torch.stack([a, b], 1)

[3] + [3] (dim=1) -> c.shape = [3, 2]
```