dùng để thay đổi hình dạng của một [[Tensor]] 
```python
a = torch.randn(5, 4)
b = a.reshape(10, 2)
print(b.shape)
```

```
(10, 2)
```