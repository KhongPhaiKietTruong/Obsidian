hiển thị các [[Attribute (Thuộc tính)]] của một [[Object (Đối tượng)]] 
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