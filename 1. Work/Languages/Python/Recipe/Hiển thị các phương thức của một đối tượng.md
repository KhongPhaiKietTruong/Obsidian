để hiển thị các [[Method (Phương thức)]] của một [[1. Work/Theory/OOP/Theory/Object]]
```python
names = dir(df)
methods = [name for name in names if callable(getattr(df, name))]
```

