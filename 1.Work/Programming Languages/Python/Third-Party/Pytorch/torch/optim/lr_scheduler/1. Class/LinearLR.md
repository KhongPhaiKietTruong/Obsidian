cú pháp:
```python
torch.optim.lr_scheduler(optimizer, start_factor, total_iters)
```
với:
- optimizer: [[1.Work/OOP/Theory/Object|Object]] optimizer mà ta đã khởi tạo 
- start_factor: chỉ số để nhân với lr ban đầu (ví dụ: 0.1\*base_lr)
- total_iters: số epoch để từ lr=start_factor\*base_lr lên lại base_lr 


> [!NOTE] 
> [[Learning Rate Scheduler]] này thường dùng để [[Warmup]] 
