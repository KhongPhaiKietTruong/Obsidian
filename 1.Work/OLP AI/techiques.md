

## 1. Cải tiến DataLoader 
### Bật pin_memory trong DataLoader  
thêm tham số "pin_memory=True"
### Bật persistent_workers trong DataLoader 
thêm tham số "persisten_workers=True"
### Bật prefetch_factor 
thêm tham số "prefetch_factor = 2"
## 2. Bật non_blocking trong Tensor.to()
thêm tham số "non_blocking=True" trong dòng code chuyển tensor từ cpu sang gpu để giúp việc này có thể diễn ra bất đồng bộ (song song), tăng tốc độ train và inference 
## 3. AMP (Automatic Mixed Precision)
dùng để tăng tốc độ train và inference 
## 4. Bật torch.compile()  
thêm một dòng đằng sau khởi tạo model, dòng này giúp giảm thời gian train, tăng tốc inference 
```python
model = MyModel()
model = torch.compile(model)
```
## 5. Bật set_to_none trong optimzier.zero_grad 
"optimizer.zero(set_to_none=True)"
### áp dụng trong function epoch_step:
ở phần **forward pass** và tính **loss**: (áp dụng phần forward pass tương tự cho val loop)
```python
# change from 
logits = model(input)
loss = loss_fn(y_batch, logits)

# to 
with torch.autocast(device_type=device, dtype=torch.float16):
​	logits = model(input)
​	loss = loss_fn(logits, y_batch)
```

ở phần tính gradient và cập nhật:
```python
# change from 
loss.backward()
optimizer.step()

# to 
scaler.scale(loss).backward()
scaler.step(optimizer)
scaler.update() 
```

### áp dụng trong training loop:
khởi tạo scaler trước khi vào training loop
```python
scaler = torch.amp.GradScaler('cuda')
# training loop
for epoch in range(EPOCHES):
​	# ...
```

## 6. label smoothing
áp dụng bằng cách thêm một tham số vào dòng khởi tạo loss function
```python
loss_fn = nn.CrossEntropyLoss(label_smoothing=0.1)
```

## 7. Gradient Clipping 
áp dụng bằng cách thêm một dòng để giới hạn gradient lại trước khi thực hiện update 
```python
torch.nn.utils.clip_grad_norm_(model.parameters(), max_norm=1.0)
```

## 8. Bật bidirectional 
trong nn.LSTM bật tham số bidirectional=True lên 
```python
nn.LSTM(..., bidirectional=True, ...)
```

## 9. Áp dụng temporal pooling 
### Áp dụng TPP (temporal pyramid pooling)
```python
import torch.nn.functional as T

tpp = torch.cat([T.adaptive_average_pool1d(rnn_out, level) for level in [1, 2, 4]])
```
### Áp dụng Attention pooling 
...

## 10. Xử lí mất cân bằng 
### Lấy mẫu có trọng số (WeightedRandomSampler trong DataLoader)
### Phạt có trọng số (Class-Weighted Loss) 
tính trọng số cho mỗi lớp (phạt nặng hơn nếu đoán sai mẫu nằm trong lớp có ít mẫu)
