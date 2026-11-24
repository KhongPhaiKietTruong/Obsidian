## Định Nghĩa 
nn.Idenity là một lớp cho ra i rang những gì nó truyền vào (không thực hiện gì cả), thường dùng khi muốn dùng một kiến trúc làm [[Feature Extractor]] bằng cách đổi lớp cuối cùng thành lớp này để cho ra [[Feature Map]] 

```python
from torchvision.models import resnet50, ResNet50_Weights
import torch.nn as nn

backbone = resnet50(weights=ResNet50_Weights.DEFAULT)
self.backbone.fc = nn.Idenity()
```