class này dùng để thực thi [[1.Work/Machine Learning/Concepts In ML/Hyperparameters/Learning Rate/Learning Rate Scheduler/CosineAnnealingLR|CosineAnnealingLR]] 
cú pháp:
```python
from torch.optim.lr_scheduler import CosineAnnealingLR

scheduler = CosineAnnealingLR(optimizer, T_max, eta_min)
```
với:
- optimizer: là [[1.Work/OOP/Theory/Object|Object]] mà ta đã khởi tạo trước đó 
- T_max: số bước để learning rate ban đầu giảm về tới mức thấp nhất (eta_min) 
- eta_min: mức [[Effective Learning Rate]] tối thiểu mà scheduler sẽ giảm về tới 