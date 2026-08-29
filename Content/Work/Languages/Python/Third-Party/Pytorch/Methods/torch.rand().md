sử dụng hàm rand(<tuple_size_of_matrix>) để tạo tensor có giá tị ngẫu nhiên trong khoảng (1, 1)
```python 
random_tensor = torch.rand((2, 2))
print(random_tensor)

output:
tensor([[0.2773, 0.9477],
        [0.6993, 0.4138]])
```