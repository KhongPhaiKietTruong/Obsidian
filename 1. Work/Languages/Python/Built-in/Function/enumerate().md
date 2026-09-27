```python
enumerate(iterable, start=0)
```
dùng để thêm một biến đếm khi duyệt qua một [[Iterable]]
start là khởi tạo ban đầu của biến đếm
```python
lst = ["truong", "anh", "kiet"]
for idx, x in enumerate(lst):
	print(idx, x)
```