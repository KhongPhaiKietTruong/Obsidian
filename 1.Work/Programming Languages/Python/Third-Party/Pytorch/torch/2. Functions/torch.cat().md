giống hoàn toàn với [[np.concatenate()]] nhưng hoạt động với [[Tensor]] 
```python
a = torch.Tensor([1, 2, 3]) # (3,)
b = torch.Tensor([4, 5, 6]) # (3,)
c = torch.cat([a,b], 0) # (6,)
```