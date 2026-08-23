đối tượng mới sẽ hoàn toàn độc lập với đối tượng cũ, các đối tượng bên trong đối tượng cũ sẽ được nhân bản sang một ô nhớ mới để đối tượng mới đó trỏ đến 
```python
lst = [1, 2, 3, 4, 5]
lst1 = lst.deepcopy()
lst1[0] = 99
print(lst)
```