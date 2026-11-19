## Định Nghĩa
ReduceLROnPlateau là một [[Learning Rate Scheduler]] với cơ chế thực hiện giảm [[Effective Learning Rate]] khi thấy giá trị [[Loss Function]] trên [[Val Set]] không giảm 

## Cú Pháp 
```python
from torch.optim.lr_scheduler import ReduceLROnPlateau

lr_scheduler = ReducerLROnPlateau(optimizer, )
```