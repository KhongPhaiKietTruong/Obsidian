giống hoàn toàn với [[np.concatenate()]] nhưng hoạt động với [[Tensor]] 
```python
torch.cat(list_tensors, dim)
```
với:
- list_tensors: là một list chứa các tensor 
- dim: số chiều muốn nối 
```python
a = torch.Tensor([1, 2, 3]) # (3,)
b = torch.Tensor([4, 5, 6]) # (3,)
c = torch.Tensor([7, 8, 9]) # (3,)
d = torch.cat([a,b,c], 0) # (9,)
```