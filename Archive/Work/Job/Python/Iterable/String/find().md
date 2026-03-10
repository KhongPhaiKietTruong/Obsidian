find(str, start, end) 
trả về vị trí một chuỗi con nằm trong chuỗi cha, nếu không có thì trả về -1 
```python
s = 'truong anh kiet ne'
a = s.find('e')
b = s.find(' ', a)

print(a, b)
```