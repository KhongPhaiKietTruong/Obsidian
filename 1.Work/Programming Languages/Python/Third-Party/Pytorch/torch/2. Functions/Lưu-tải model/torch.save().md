torch.save() dùng để biến một [[1.Work/OOP/Theory/Object]] thành dạng dữ liệu có thể ghi xuống ổ đĩa và lưu lại thành một file, thường được sử dụng để lưu lại model 
```python
torch.save(<object>, <tên_file>)
```


```python
torch.save(model_0.state_dict(),MODEL_SAVE_PATH)
```