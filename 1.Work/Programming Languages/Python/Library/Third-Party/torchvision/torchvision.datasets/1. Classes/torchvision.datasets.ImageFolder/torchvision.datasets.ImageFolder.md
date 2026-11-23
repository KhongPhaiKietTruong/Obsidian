ImageFolder là một [[1.Work/OOP/Theory/Class|Class]] giúp đọc folder [[Training Set]] tạo thành [[1.Work/OOP/Theory/Object|Object]] của class [[torch.utils.data.Dataset]]
giả sử:
```
dataset/
​	cats/
​	​	cat1.jpg
​	​	cat2.jpg
​	dogs/
​	​	dog1.jpg
​	​	dog2.jpg
```
tạo object Dataset từ folder "dataset":
```python
datasets = datasets.ImageFolder(
​	root = './datasets'
​	transform = transform 
)
```

