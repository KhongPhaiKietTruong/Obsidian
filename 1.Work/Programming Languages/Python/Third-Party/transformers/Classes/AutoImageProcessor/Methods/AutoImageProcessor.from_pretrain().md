dùng để tải pipeline tiền xử lí của một model thông qua file "preprocessor_config.json" (nằm trong cache, xem thêm ở [[Hugging Face Cache]]) của model đó 
ví dụ:
```python
from transformer import AutoImageProcessor
from PIL import Image 

preprocessor = AutoImageProcessor.from_pretrained('microsoft/resnet-18')
img = Image.open('...').convert('RGB')
img = preprocessor(img, return_tensors='pt')
```
với:
- preprocessor có thể nhận vào [[PIL.Image]] (recommended) và [[Tensor]]
- tham số return_tensors chỉ định định dạng output trả với ('pt' là pytorch tensor)
