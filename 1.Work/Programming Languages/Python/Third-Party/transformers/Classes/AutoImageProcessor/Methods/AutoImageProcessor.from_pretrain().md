dùng để tải pipeline tiền xử lí của một model thông qua file "preprocessor_config.json" (nằm trong cache, xem thêm ở [[Hugging Face Cache]]) của model đó 
ví dụ:
```python
from transformer import AutoImageProcessor
preprocessor = AutoImageProcessor.from_pretrained('microsoft/resnet-18')
img 
```
