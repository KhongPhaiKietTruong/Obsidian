```python
from torchvision.models import resnet18

NUM_CLASSES = 5
model = resnet18(weights=None)
model.fc = nn.Linear(model.fc.in_features, 5) # so lop cua bai toan hien tai cua ban 
model = model.to(device)
```