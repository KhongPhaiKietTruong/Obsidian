dùng để tải pipeline tiền xử lí của một model
```python
from transformer import AutoImageProcessor
preprocessor = AutoImageProcessor(pretrained_model_name_or_path=None)
```
với:
- pretrained_model_name_or_path: nhận vào một [[Model ID]] hoặc một đường dẫn đến folder nằm trong snapshots của repo HF trong cache (xem thêm ở [[Hugging Face Cache]]) 