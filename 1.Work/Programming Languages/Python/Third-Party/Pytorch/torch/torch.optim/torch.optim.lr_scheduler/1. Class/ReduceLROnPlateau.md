## Định Nghĩa
ReduceLROnPlateau là một [[Learning Rate Scheduler]] với cơ chế thực hiện giảm [[Effective Learning Rate]] khi thấy giá trị [[Loss Function]] trên [[Val Set]] không giảm 

## Cú Pháp 
```python
from torch.optim.lr_scheduler import ReduceLROnPlateau

lr_scheduler = ReducerLROnPlateau(optimizer, mode, factor, patience)

# eval loop 
for X, y in val_dataloader:
	...
	val_loss /= len(val_dataloader)
	lr_scheduler.step(val_loss)
	
```
với: 
- optimizer: [[1.Work/OOP/Theory/Object|Object]] của [[Optimizer]] mà ta đã khởi tạo 
- mode: 
- factor: hệ số giảm LR 
- patience: bao nhiêu epoch mà chỉ số không cải thiện thì sẽ thực hiện giảm ? 
- 