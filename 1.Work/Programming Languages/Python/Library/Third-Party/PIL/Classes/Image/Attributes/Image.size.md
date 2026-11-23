trả về [[Tuple]] kích thước **(W, H)** của một [[PIL.Image]] 
ví dụ:
```python
from PIL import Image
img = Image.open('img.jpg')
print(img.size)
```
output:
```
(224, 224)
```
