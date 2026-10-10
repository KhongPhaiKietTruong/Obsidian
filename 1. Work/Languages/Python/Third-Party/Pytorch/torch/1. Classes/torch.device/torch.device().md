là một [[1. Work/Theory/OOP/Theory/Object|Object]] thể hiện thiết bị (cpu, cuda, ...)

thường dùng kèm với [[torch.cuda.is_available()]]
```python
device = torch.device('cuda' if torch.cuda.is_available() else 'cpu')
```