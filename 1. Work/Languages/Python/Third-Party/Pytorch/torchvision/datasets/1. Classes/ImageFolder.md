là một [[1. Work/Theory/OOP/Theory/Class|Class]] giúp đọc ảnh và tự gán nhãn ảnh (dựa trên tên thư mục cha chứa ảnh đó)
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
code đọc ảnh từ folder "datasets"
```python
datasets = datasets.ImageFolder(
​	root = './datasets'
​	transform = transform 
)
```

## Giá trị trả về 
trả về một datasets [[1. Work/Theory/OOP/Theory/Object|Object]] (cũng là một  [[Iterable]]), mỗi một phần tử là một [[Tuple]] (img, class) với img là [[Tensor]] ảnh
```python
img, class = datasets[0]
```