dùng để tải kiến trúc model, các [[Hyperparameter]] của một model thông qua file "config.json" (nằm trong cache, xem thêm ở [[Hugging Face Cache]]) của model đó 
```python
from transformer import AutoConfig
config = AutoConfig.from_pretrained(pretrained_model_name_or_path=None)
```
