nn.Module là [[1.Work/OOP/Theory/Class]] đại điện cho model, khi tự định nghĩa model, ta phải kế thừa class này và thực hiện định nghĩa hàm [[Constructor]] `__init__`  và hàm `forward` 

```python
class UNet(nn.Module):
​	def __init__(self):
​	​	pass
​	def forward(self, x):
​	​	pass 
```

khi truyền input vào model, ta phải truyền theo đúng shape **(B, C, H, W)** 
```python
model = UNet()
output = model(torch.randn(1, 3, 224, 224)) 
```

