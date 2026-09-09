dùng để chuyển từ một mảng numpy sang một tensor
```python 
a = np.random.random_sample((2, 3))
b = torch.from_numpy(a)
print(b)
```

lưu ý: kiểu dữ liệu mặc định của mảng numpy là float64, khi dùng hàm này, tensor vẫn sẽ mang kiểu dữ liệu float64 luôn.
tuy nhiên pytorch thường dùng mặc định là float32 nên ta thường chuyền về float 32 để không xảy ra lỗi ngoài ý muốn
```python
b = torch.from_numpy(a).type(torch.float32)
```