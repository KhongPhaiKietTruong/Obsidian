sum(iterable, start=0)
start là tổng ban đầu
trả về tổng các phần tử của một iterable
```python
lst = [1, 2, 3]
tu = 1, 2, 3
lst1 = [[1, 2, 3], [2, 3, 4]]

print(sum(lst))
print(sum(tu))
print(sum(lst1, start=[]))
```