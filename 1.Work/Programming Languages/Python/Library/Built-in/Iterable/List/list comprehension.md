## list comprehension

```python
lst1 = list(range(1, 11))

lst2 = [x**2 for x in lst1]
lst3 = [x for x in lst1 if x%2==0]
lst4 = [x if x%2==0 else 0 for x in lst1]

print(lst2)
print(lst3)
print(lst4)
```
