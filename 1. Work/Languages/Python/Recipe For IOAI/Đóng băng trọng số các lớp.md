```python
# Dong bang tat ca tham so trong mang neural 
for param in model.features.parameters():
    param.requires_grad = False
```