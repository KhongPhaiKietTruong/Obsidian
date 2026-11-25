## Cấu Trúc Cơ Bản
Train epoch là một lần model học trên [[Training Set]], gồm 5 phần cơ bản không thể thiếu:
- bước 1: thực hiện [[Forward Pass]] để cho ra prediction của model
- bước 2: tính [[Loss Function]] bằng prediction (của bước 1) và [[Ground Truth]] 
- bước 3: reset và tính [[Gradient]]
- bước 4: thực hiện update [[Weight]] của model 

```python
def train_epoch()
for epoch in range(epochs):
​	model.train() # đưa model vào chế độ training
​	for X_batch, y_batch in train_loader:
		# bước 1:thực hiện forward pass để dự đoán
		​y_pred = model(X_batch) 
		# bước 2: tính loss của batch 
		​loss = loss_fn(y_pred, y_batch) 
		# bước 3: reset và tính gradient
		​optimizer.zero_grad() 
		​loss.backward() 
		# bước 4: thực hiện update
		​optimizer.step() 

```

## Cấu Trúc Nâng Cao 
Ngoài các thao tác như ở phần cấu trúc cơ bản, ta còn có thể áp dụng 


