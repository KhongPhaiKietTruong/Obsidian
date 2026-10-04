```python
# Dong bang tat ca tham so trong mang neural 
for param in model.features.parameters(): # hoat model.parameters tuy kien truc 
    param.requires_grad = False
```

code này chưa hề đóng băng [[1. Work/Theory/Machine Learning/Concepts/Model Architecture/Head/Head|Head]] 