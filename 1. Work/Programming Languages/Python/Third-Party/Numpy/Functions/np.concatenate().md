dùng để nối các mảng lại với nhau theo một trục cho trước (không tạo ra chiều mới)
```python
a = np.array([1, 2, 3]) # (3,)
b = np.array([4, 5, 6, 7]) # (3,)
c = np.concatenate([a, b], axis=0) # (6,)
```


> [!NOTE] Notes
> Các mảng phải có số chiều và kích thước mọi chiều khớp nhau hoàn toàn ngoại trừ kích thước ở chiều mà ta ghép 
