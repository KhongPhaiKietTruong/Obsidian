phép gán = bình thường không tạo ra list mới, nó chỉ tạo ra tên mới nhưng vẫn trỏ tới vùng nhớ của list cũ
```python
lst = [1, 2, 3, 4, 5]
lst1 = lst
lst1[0] = 99
print(lst)
```