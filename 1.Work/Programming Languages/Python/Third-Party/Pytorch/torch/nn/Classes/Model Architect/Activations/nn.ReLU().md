dùng để khai báo lớp [[Activations]] [[ReLU]] 
```python
nn.ReLU(inplace=False)
```
với:
- inplace = True sẽ ghi đè lên tensor cũ mà không tạo tensor mới (tốn VRAM)
