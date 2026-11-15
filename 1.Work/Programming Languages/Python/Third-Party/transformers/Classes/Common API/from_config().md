## Định Nghĩa 
from_config() dùng để khởi tạo một kiến trúc model nhưng [[Weight]] được khởi ngẫu nhiên (thường là theo [[He Initialization]]) chứ không dùng pretrained weight 
```python
from transformers import AutoConfig 

resnet18_config = AutoConfig.from_pretrained('microsoft/resnet-18')
resnet18 = AutoModel.from_config(resnet18_config)
```