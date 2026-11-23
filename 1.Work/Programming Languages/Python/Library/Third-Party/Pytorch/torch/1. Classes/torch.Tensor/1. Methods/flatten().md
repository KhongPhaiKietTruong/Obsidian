dùng để gộp các chiều có vị trí từ start đến end lại với nhau
```python
Tensor.flatten(start_dim=0, end_dim=-1)
```

```python
a.shape() # (32, 512, 1, 1)
a = a.flatten(1, -1)
a.shape() # (32, 512)
```