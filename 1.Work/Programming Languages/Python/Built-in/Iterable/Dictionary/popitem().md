trả về một tuple là cặp key value của phần tử được thêm vào dict gần nhất

```python
d = {'name': 'kiet', 'age': 19}
d['sex'] = 'male'
print(d.popitem())
print(help(dict.popitem))
```