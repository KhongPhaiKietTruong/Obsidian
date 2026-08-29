để hiển thị các [[Method (Phương thức)]] của một [[Object (Đối tượng)]]
```python
names = dir(df)
methods = [name for name in names if callable(getattr(df, name))]
```

