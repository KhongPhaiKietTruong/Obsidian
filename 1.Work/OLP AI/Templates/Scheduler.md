```python
from torch.optim.lr_scheduler import CosineAnnealingLR 

scheduler = CosineAnnealingLR(optmizer, T_max=EPOCHS, eta_min=1e-6)
```