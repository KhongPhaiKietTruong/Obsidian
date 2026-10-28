```python
from torchvision.models import resnet18

model = resnet18(weights=None)
model.fc.out_features = num_classes # so lop cua bai toan hien tai cua ban 

```