```python
for epoch in range(epochs):
​	for X_batch, y_batch in train_loader:

​	​	model.train() #1. đưa model vào chế độ training (tùy chọn)
​	​	​optimizer.zero_grad() #2 reset gradient 

​	​	y_pred = model(X_batch) #3. thực hiện forward pass để dự đoán
​	​	loss = loss_fn(y_pred, y_batch) #4. tính loss của batch 

​	​	loss.backward() #5. tính gradient của từng tham số  

​	​	optimizer.step() #6. thực hiện update ​	

```


