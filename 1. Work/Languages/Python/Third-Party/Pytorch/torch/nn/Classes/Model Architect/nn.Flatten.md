dùng để biến một [[Tensor]] nhiều chiều thành một [[Vector]] 
mặc định sẽ giữ nguyên chiều đầu tiên (là chiều chứa batch size)
```python
a = torch.rand(32, 3, 28, 28)
flatten = nn.Flatten()
b = flatten(a)

# b.shape = (32, 2352)
```

thường được sử dụng để làm phẳng [[Feature Map F]] thành một vector để có thể truyền vào [[nn.Linear]] 