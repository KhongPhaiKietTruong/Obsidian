## Định Nghĩa 
torch.save() dùng để biến một [[1.Work/OOP/Theory/Object]] thành dạng dữ liệu có thể ghi xuống ổ đĩa và lưu lại thành một file, thường được sử dụng để lưu lại trọng số model trong một file 

## Cú Pháp 
```python
torch.save(model, path)
```
với:
- model: tên của object model 
- path: nơi lưu + tên file 

ví dụ:
```python
torch.save(model.state_dict(), "./best_model.pt")
```
