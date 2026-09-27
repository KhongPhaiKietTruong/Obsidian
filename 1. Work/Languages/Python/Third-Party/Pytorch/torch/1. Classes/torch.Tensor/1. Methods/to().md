dùng để chuyển [[Tensor]] từ cpu sang gpu 
```python
a = torch.Tensor([1, 2, 3]).to(device, non_blocking=<bool>)
```
với non_blocking là 