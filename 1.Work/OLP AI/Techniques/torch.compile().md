kĩ thuật này giúp tăng đáng kể thời gian train model 
thêm một dòng đằng sau khởi tạo model
```python
model = MyModel(...)
model = torch.compile(model)
```
lưu ý: khi thực hiện kĩ thuật này phải thực hiện unwrap trước khi save mô hình 