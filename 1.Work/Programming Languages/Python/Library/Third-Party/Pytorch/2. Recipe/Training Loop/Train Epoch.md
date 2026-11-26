## Cấu Trúc Cơ Bản
Train epoch là một hàm số thực hiện một lần model học trên [[Training Set]] nhận vào các tham số cơ bản như: model, dataloader, criterion, optimizer, device (ở cấu trúc nâng cao sẽ có thêm nữa)
gồm 5 phần cơ bản không thể thiếu:
- bước 1: thực hiện [[Forward Pass]] để cho ra prediction của model
- bước 2: tính [[Loss Function]] bằng prediction (của bước 1) và [[Ground Truth]] 
- bước 3: reset và tính [[Gradient]]
- bước 4: thực hiện update [[Weight]] của model 

```python
def train_epoch(model, dataloader, criterion, optimizer, device):
​	model.train() # đưa model vào chế độ training
	train_loss = 0.0
​	for X_batch, y_batch in dataloader:
		# bước 1:thực hiện forward pass để dự đoán
		​y_pred = model(X_batch) 
		# bước 2: tính loss của batch 
		​loss = criterion(y_pred, y_batch) 
		train_loss += loss.item()
		# bước 3: reset và tính gradient
		​optimizer.zero_grad(set_to_none=True) 
		​loss.backward() 
		# bước 4: thực hiện update
		​optimizer.step() 
		
	num_batches = len(train_loader)
	train_loss /= batch_size 
	
	return {'train_loss': train_loss, # cac metric khac tuy bai toan}

```

## Cấu Trúc Nâng Cao 
Ngoài các thao tác như ở phần cấu trúc cơ bản, ta còn có thể áp dụng các kĩ thuật như: [[AMP - Automatic Mixed Precision]] (tham số scaler), [[Gradient Clipping]] 


```python
def train_epoch(model, dataloader, criterion, optimizer, device, scaler):
​	model.train() # đưa model vào chế độ training
​	for X_batch, y_batch in dataloader:
			# bước 1:thực hiện forward pass để dự đoán 
		with torch.autocast(device_type=device, dtype=torch.float16):
			​y_pred = model(X_batch) 
			# bước 2: tính loss của batch 
			​loss = criterion(y_pred, y_batch) 
		​optimizer.zero_grad(set_to_none=True) 
		scaler.scale(loss).backward()
		# buoc 3: gradient clipping
		scaler.unscale_(optimizer)
		torch.nn.utils.clip_grad_norm_(model.parameters(), max_norm=1.0)
		# bước 4: reset và tính gradient
		​scaler.step(optimizer)
		scaler.update()
```


