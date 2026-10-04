```python
# Dong bang tat ca tham so trong mang neural 
for param in model.features.parameters(): # hoat model.parameters tuy kien truc 
    param.requires_grad = False
```

đóng băng toàn bộ tham số, sau đó ta thay đầu classifier khác với requires_grad=True 

in ra tên các lớp cùng trạng thái của lớp đó
```python
for name, param in model.named_parameters():
    param.requires_grad=False
    print(name, param.requires_grad)
```