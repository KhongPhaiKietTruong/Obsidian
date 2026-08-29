hiển thị các [[Attribute (Thuộc tính)]] của một [[Object (Đối tượng)]] 
```python 
names = dir(df)
methods = [name for name in names if not callable(getattr(df, name))]
```