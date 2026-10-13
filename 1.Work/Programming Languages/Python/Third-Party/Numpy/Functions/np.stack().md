Dùng để ghép các mảng lại và **tạo ra thành một chiều mới**
```python
a = np.array([1, 2, 3])
b = np.array([4, 5, 6])
c = np.stack([a, b], 1)
print(a.shape, b.shape, c.shape)
```

``` 
output
(3,) (3,) (3, 2)
```

