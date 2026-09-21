đối tượng mới sẽ hoàn toàn độc lập với đối tượng cũ, các đối tượng bên trong đối tượng cũ sẽ được nhân bản sang một ô nhớ mới để đối tượng mới đó trỏ đến 
```python
import copy

lst = [1, 2, 3, 4, 5]
lst1 = copy.deepcopy(lst)
lst1[0] = 99
# đối tượng gốc là lst hoàn toàn không bị ảnh hưởng 
print(lst)
```