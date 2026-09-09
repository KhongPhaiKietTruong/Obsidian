```python
for epoch in range(epochs):
​	model.train() #1. đưa model vào chế độ training 

​	y_pred = model(X_train) #2. thực hiện forward pass để dự đoán
​	
​	loss = loss_fn(y_pred, y_true) #3. tính loss của batch 

​	optimizer.zero_grad()

​	loss.backward() #4. tính gradient của từng tham số  

​	optimizer.step() #5. thực hiện update ​	
```

