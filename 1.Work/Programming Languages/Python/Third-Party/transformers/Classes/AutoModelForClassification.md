dùng để khởi tạo một [[1.Work/OOP/Theory/Object|Object]] model cho tác vụ [[1.Work/Machine Learning/Concepts In ML/Type Of Tasks In ML/Classification/Classification|Classification]] 
```python
from transformers import AutoModelForImageClassification 
model = AutoModelForImageClassification.from_pretrained('google/vit-base-patch16-224')
```