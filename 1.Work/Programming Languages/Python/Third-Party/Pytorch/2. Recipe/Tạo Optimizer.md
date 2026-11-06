```python
optimizer = torch.optim.Adam(
​	params = model.parameters(),
​	lr = <learning_rate> 
)
```
với:
- params là một [[Iterable]] chứa các con trỏ trỏ với [[Tensor]] [[Weight]] của mô hình 
- lr: là [[Base Learning Rate]] 