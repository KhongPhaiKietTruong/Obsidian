
max(iterable, key) return the max value of a iterable

ex:
```python
max("hello")
```
output:
```python
'o'
```

ex:
```python
names = ["kiet", "truong", "ai"]
max_name = max(names, key=len)
```
output:
```python
"truong"
```

ex:
```python
items = [(1, 3), (2, 10), (5, 2)]
result = max(items, key=lambda x: x[1])
```
output:
```python
(2, 10)
```
