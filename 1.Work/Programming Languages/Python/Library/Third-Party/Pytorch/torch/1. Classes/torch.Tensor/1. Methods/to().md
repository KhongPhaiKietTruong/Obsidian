dùng để chuyển [[Tensor]] từ cpu sang gpu 
```python
a = torch.Tensor([1, 2, 3]).to(device, non_blocking=<bool>)
```
để non_blocking=True sẽ giúp việc đem Tensor từ CPU qua GPU một cách bất đồng bộ để model train nhanh hơn 