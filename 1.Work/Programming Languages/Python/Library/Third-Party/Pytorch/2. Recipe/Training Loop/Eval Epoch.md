## Cấu Trúc Cơ Bản
EVal epoch là hàm số thực hiện một lần model đánh trên [[Ground Truth]] của [[Training Set]] nhận vào các tham số cơ bản như: model, dataloader, criterion, optimizer, device (ở cấu trúc nâng cao sẽ có thêm nữa)
gồm 5 phần cơ bản không thể thiếu:
- bước 1: thực hiện [[Forward Pass]] để cho ra prediction của model
- bước 2: tính [[Loss Function]] bằng prediction (của bước 1) và [[Ground Truth]] 
- bước 3: reset và tính [[Gradient]]
- bước 4: thực hiện update [[Weight]] của model 

```python
def train_epoch(model, dataloader, criterion, device, scaler):
	
	eval_loss=0.0
	​model.train() # đưa model vào chế độ training
	
	​for X_batch, y_batch in dataloader:
		# bước 1:thực hiện forward pass để dự đoán
		​y_pred = model(X_batch) 
		# bước 2: tính loss của batch 
		​loss = loss_fn(y_pred, y_batch) 
		eval_loss += loss.item()
		
	num_batches = len(dataloader)
	eval_loss /= num_batches
	return {"eval_loss": eval_loss, # cac metric phu hop bai toan}
```

