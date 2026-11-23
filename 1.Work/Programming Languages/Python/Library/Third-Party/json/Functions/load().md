json.load giúp chuyển một file json thành một [[Dictionary]] 

giả sử có ta có file 'data.json'
```json
{
    "name": "Kiet",
    "age": 20,
    "skills": ["Python", "Machine Learning"]
}
```

```python
import json

with open("data.json", "r") as f:
    data = json.load(f)

print(data)
```

output:
```python
{
    'name': 'Kiet',
    'age': 20,
    'skills': ['Python', 'Machine Learning']
}
```