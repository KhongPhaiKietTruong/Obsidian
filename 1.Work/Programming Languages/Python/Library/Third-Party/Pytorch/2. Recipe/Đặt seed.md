```python
random.seed(SEED)
torch.manual_seed(SEED)
if torch.cuda.is_available():
​	torch.cuda.manual_seed(SEED)
```