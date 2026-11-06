dùng để tải pipeline tiền xử lí của một model thông qua file "preprocessor_config.json" (nằm trong cache, xem thêm ở [[Hugging Face Cache]]) của model đó 
```python
from transformer import AutoImageProcessor
preprocessor = AutoImageProcessor.from_pretrained(pretrained_model_name_or_path=None)
```
