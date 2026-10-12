hiển thị các [[Attribute]] của một [[1. Work/Theory/OOP/Theory/Object]] 
```python 
attributes = []
for name in dir(a):
    try:
        if not callable(getattr(a, name)):
            attributes.append(name)
    except Exception as e:
        pass
print(attributes)
```