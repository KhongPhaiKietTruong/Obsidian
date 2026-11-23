hoạt động tương tự như một [[Function]], trả về một [[Dictionary]] chứa tần suất xuất hiện các phần tử trong một [[Iterable]] 

```python
from collections import Counter

data = ["cat", "dog", "cat", "bird", "dog", "cat"]

counter = Counter(data)

print(counter)
```

output:
```python
Counter({'cat': 3, 'dog': 2, 'bird': 1})
```

