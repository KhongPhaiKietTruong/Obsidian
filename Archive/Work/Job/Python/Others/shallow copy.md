tạo ra một biến nhưng trỏ tới cùng một địa chỉ **của lớp ngoài cùng**, thay đổi trên lớp ngoài cùng sẽ không thay đổi lên bản gốc 
```python
l = [1, [2, 3]]
l1 = l.copy()
l1[0] = 99
print(l)

l = [1, 2, 3]
l1 = l.copy()
l1[0] = 99
print(l)
```

lưu ý: khi thay đổi một iterable bên trong thì nó vẫn thay đổi lên bản gốc
```python
l = [1, [2, 3]]
l1 = l.copy()
l1[1][0] = 99
print(l)
```

```python
a = [1, 2, 3]
b = a
b[0] = 99
print(b)
```