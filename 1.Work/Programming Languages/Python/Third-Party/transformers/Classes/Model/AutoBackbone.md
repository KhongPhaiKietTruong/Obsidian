## Định Nghĩa 
AutoBackbone là một [[1.Work/OOP/Theory/Class|Class]] chuyên dùng để khởi tạo [[Backbone]] cho Computer Vision, có khả năng lấy ra [[Feature Map]] ở những stage do mình chỉ định 
ví dụ:
```python
from transformers import AutoBackbone

backbone = AutoBackbone.from_pretrained(
    "microsoft/resnet-18",
    out_indices=(1, 2, 3, 4)
)

outputs = backbone(img)
feature_maps = outputs.feature_maps # mot tuple chua feature_map cua cac stageg 
```
