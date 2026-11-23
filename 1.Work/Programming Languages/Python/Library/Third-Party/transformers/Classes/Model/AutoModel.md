## Định Nghĩa 
AutoModel là một [[1.Work/OOP/Theory/Class|Class]] dùng để khởi tạo một model dựa trên [[Model ID]] mà không có phần [[1.Work/Machine Learning/Deep Learning/Concepts In DL/Model Architecture/Head|Head]] 
```python
from transformers import AutoModel 

model = AutoModel('microsoft/resnet50')

outputs = model(pixel_values=image)
# co the dung: outputs = model(image) 
```
với:
- pixel_values: nhận vào [[Tensor]] ảnh 

## Khác Biệt So Với AutoBackbone 