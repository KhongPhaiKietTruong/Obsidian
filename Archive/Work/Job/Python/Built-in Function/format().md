dùng để chèn biến vào văn bản

cách dùng 1:
```python
str1 = 'toi ten la {}, toi {} tuoi'
print(str1.format('kiet', 19))
```

cách dùng 2:
```python
str1 = 'toi ten la {1}, toi {0} tuoi'
print(str1.format(19, 'kiet'))
```

các dùng 3:
```python
str1 = 'toi ten la {name}, toi {age} tuoi'
print(str1.format(name='kiet', age=19))
```

cả 3 cách đều cho ra output: toi ten la kiet, toi 19 tuoi