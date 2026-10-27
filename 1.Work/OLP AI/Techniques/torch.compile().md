kĩ thuật này giúp tăng đáng kể thời gian train model 
thêm một dòng đằng sau khởi tạo model
```python
model = MyModel(...)
model = torch.compile(model)
```

khi sử đụng hàm này, pytorch bọc model trong một wrapper nên khi thực hiện lưu model, ta phải thực hiện lấy model gốc chưa bị bọc lại:
```python
raw_model = getattr(model, '_orig_mod', model) # lay lai model goc 
torch.save(raw_model.state_dict(), save_path)
```