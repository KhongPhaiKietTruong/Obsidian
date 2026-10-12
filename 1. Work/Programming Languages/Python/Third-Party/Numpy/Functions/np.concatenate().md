dùng để nối các mảng lại với nhau theo một trục cho trước (không tạo ra chiều mới)
```python
a = np.array([1, 2, 3])
b = np.array([4, 5, 6, 7])
c = np.concatenate([a, b], axis=0)
print(a.shape)
print(b.shape)
print(c.shape)
```
output:
```
(3,)
(4,)
(7,)
```

> [!NOTE] Notes
> Các mảng phải có số chiều và kích thước mọi chiều khớp nhau hoàn toàn ngoại trừ kích thước ở chiều mà ta ghép 
> ví dụ:
>- Mảng A: `(3, 4)`
>- Mảng B: `(5, 4)`
>- Kết quả: `(8, 4)` (hợp lệ vì trục 1 đều bằng 4).

