```python
import copy
a = [1, 2, 3]
b = copy.deepcopy(a)
b[0] = 99

print(a)
print(b)

```