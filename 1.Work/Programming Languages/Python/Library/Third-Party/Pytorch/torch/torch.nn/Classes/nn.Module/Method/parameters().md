dùng để trả về **một** [[Iterator]] trỏ đến từng [[Tensor]] trọng số trong một mô hình [[Neural Network]], thường dùng để chỉ định tham số nào để [[Optimizer]] có thể thực hiện tối ưu lên (tham khảo thêm tại [[Tạo Optimizer]]) 

```python
optimizer = torch.optim.Adam (
​	params = model.parameters(),
​	lr = <learning_rate> 
)
```