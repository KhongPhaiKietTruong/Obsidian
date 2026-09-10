dùng để chuyển [[Tensor]] sang gpu, tpu, ... hoặc để chuyển kiểu dữ liệu của nó 
```python 
 a = torch.rand((2, 3))
 a = a.to('cuda', non_blocking=True)
```

tham số non_blocking là để không để quá trình chuyển tensor qua gpu khiến chương trình dừng tạm thời, mà thay vào đó, trong thời gian chuyển, nó sẽ đi làm một việc gì đó khác 
