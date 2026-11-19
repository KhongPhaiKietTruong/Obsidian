## Định Nghĩa 
## Code 
```python
from torchvision.models.segmentation import deeplabv3_resnet50
from torchvision.models import ResNet50_Weights

deeplab_model = deeplabv3_resnet50(weights_backbone=ResNet50_Weights.DEFAULT, num_classes=n)

# training loop
for X, y in train_dataloader"
	outputs = deeplab_model(X) # output là dict: "out" va "aux"
	pred = outputs['out'] # lay ra logits 

```