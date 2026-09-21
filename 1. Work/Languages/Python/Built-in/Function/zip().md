zip(\*iterable, strict=False)
trả về một iterator (zip object) chứa tuple các cặp
dùng để duyệt đồng thời nhiều iterable cùng một lượt
strict được bật sẽ báo lỗi nếu các iterable có độ dài khác nhau
```python
lst = [1, 2, 3]
lst1 = [4, 5, 6]

for k, v in zip(lst, lst1):
	print(k, v)
```