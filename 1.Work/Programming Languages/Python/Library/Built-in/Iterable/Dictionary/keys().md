trả về một object chứa các key của [[Dictionary]], object này tự động cập nhật nếu dictionary có sự thay đổi
```python
d = {'name': 'kiet', 'age': 19}
k = d.keys()
print(k)
# output:
# dict_keys(['name', 'age'])
# co the chuyen dict_keys thanh list bang: new_k = list(k)
```
