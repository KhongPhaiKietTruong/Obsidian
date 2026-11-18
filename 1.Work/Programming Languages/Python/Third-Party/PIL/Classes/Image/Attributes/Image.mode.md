## Định Nghĩa 
Image.mode cho biết cách ảnh biểu diễn dữ liệu bao gồm số kênh màu, loại kênh, ...
```python
from PIL import Image 
img = Image.open('cat.jpg')
print(img.mode)
# output: 'BGR'
```
các mode phổ biến:
- RGB
- BGR (mặc định của PIL)
- 1: ảnh đen trắng 
