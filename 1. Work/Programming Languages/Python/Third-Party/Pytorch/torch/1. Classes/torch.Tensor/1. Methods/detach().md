dùng để tách một [[Tensor]] ra khởi computational graph 
hàm này được dùng thông dụng nhất khi cần chuyển một tensor sang mảng numpy
```python
a = a.detach().cpu().numpy()
```