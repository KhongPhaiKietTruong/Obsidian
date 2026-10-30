oclass này dùng để thực thi [[1.Work/Machine Learning/Concepts In ML/Hyperparameters/Learning Rate/Learning Rate Scheduler/CosineAnnealingLR|CosineAnnealingLR]] 
cú pháp:
```python
from torch.optim.lr_scheduler import CosineAnnealingLR

scheduler = CosineAnnealingLR(optimizer, T_max, eta_min=0.0)
```
với:
- optimizer: là [[1.Work/OOP/Theory/Object|Object]] mà ta đã khởi tạo trước đó 
- T_max: số bước để learning rate ban đầu giảm về tới mức thấp nhất (eta_min) (giá trị này thường đặt là tổng số epoch dự định train)
- eta_min: mức [[Effective Learning Rate]] tối thiểu mà scheduler sẽ giảm về tới (giá trị này thường đặt là 1% so với lr ban đầu)