
```python
torch.save(<object>, <tên_file>)
```
dùng để biến một [[Object (Đối tượng)]] thành dạng dữ liệu có thể ghi xuống ổ đĩa và lưu lại trong thành một file

```python
torch.save(obj=model_0.state_dict(),
           f=MODEL_SAVE_PATH)
```