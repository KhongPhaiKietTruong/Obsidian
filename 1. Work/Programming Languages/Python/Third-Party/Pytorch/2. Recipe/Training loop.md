```python
for epoch in range(epochs):
​	model.train() # đưa model vào chế độ training
​	for X_batch, y_batch in train_loader:

​	​	y_pred = model(X_batch) # thực hiện forward pass để dự đoán
​	​	loss = loss_fn(y_pred, y_batch) # tính loss của batch 
​	​	
​	​	​optimizer.zero_grad() # reset gradient 
​	​	loss.backward() # tính gradient của từng tham số  

​	​	optimizer.step() #6. thực hiện update ​	

```




