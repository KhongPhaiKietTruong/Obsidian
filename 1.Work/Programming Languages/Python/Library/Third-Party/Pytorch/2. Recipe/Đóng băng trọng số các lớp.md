## Đóng Băng Model Có Sẵn
```python
model = resnet50()
print(model) # in ra de xem kien truc de biet cach dong bang 
for param in model.parameters(): # hoac model.features.parameters tuy kien truc 
    param.requires_grad = False
    
model.fc = nn.Linear(1024, C) # C: so lop cua bai toan dang lam 
```

đóng băng toàn bộ tham số, sau đó ta thay đầu classifier khác với requires_grad=True 

in ra tên các lớp cùng trạng thái của lớp đó
```python
for name, param in model.named_parameters():
    param.requires_grad=False
    print(name, param.requires_grad)
```

## Đóng Băng Custom Model 
```python
class MyModel(nn.Module):
	def __init__(self):
		super().__init__()
		self.backbone = resnet50()
		self.fc = nn.Linear(1024, C) #C: so class cua bai toan dang thuc hien 
	def forward(self, x):
		return self.fc(self.backbone(x))
```