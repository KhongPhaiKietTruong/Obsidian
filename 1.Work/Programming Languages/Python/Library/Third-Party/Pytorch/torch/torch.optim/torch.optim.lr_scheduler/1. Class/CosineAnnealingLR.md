## Định Nghĩa 
class này dùng để thực thi [[1.Work/Machine Learning/Machine Learning/Hyperparameters/Learning Rate/Learning Rate Scheduler/CosineAnnealingLR|CosineAnnealingLR]] 
cú pháp:
```python
from torch.optim.lr_scheduler import CosineAnnealingLR

optimizer = torch.optim.AdamW(lr=1e-4, weight_decay=)
scheduler = CosineAnnealingLR(optimizer, T_max, eta_min=0.0)
```
với:
- optimizer: là [[Optimizer]] [[1.Work/OOP/Theory/Object|Object]] mà ta đã khởi tạo trước đó 
- T_max: số bước để learning rate ban đầu giảm về tới mức thấp nhất (eta_min) (giá trị này thường đặt là tổng số epoch dự định train)
- eta_min: mức [[Effective Learning Rate]] tối thiểu mà scheduler sẽ giảm về tới (lưu ý: eta_min là giá trị chứ không phải là tỉ lệ !)