
```
names = dir(df)
methods = [name for name in names if callable(getattr(df, name))]
```

sửa đổi lại xíu để thành hiển thị các thuộc tính của một đối tượng