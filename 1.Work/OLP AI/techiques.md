

## Cải tiến DataLoader 
### Bật pin_memory trong DataLoader  
thêm tham số "pin_memory=True" trong dòng code tạo DataLoader, tham số này 
### Bật persistent_workers trong DataLoader 
thêm tham số "persisten_workers=True"
### Bật prefetch_factor 
thêm tham số "prefetch_factor = 2"
## Bật non_blocking trong Tensor.to()
thêm tham số "non_blocking=True" trong dòng code chuyển tensor từ cpu sang gpu để giúp việc này có thể diễn ra bất đồng bộ (song song), tăng tốc độ train và inference 
## AMP (Automatic Mixed Precision)
dùng để tăng tốc độ train và inference 
## Bật torch.compile()  
thêm một dòng đằng sau khởi tạo model: "model = torch.compile(model)", dòng này giúp giảm thời gian train, tăng tốc inference 
## Bật set_to_none trong optimzier.zero_grad 
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

## label smoothing
áp dụng bằng cách thêm một tham số vào dòng khởi tạo loss function
```python
loss_fn = nn.CrossEntropyLoss(label_smoothing=0.1)
```

## Gradient Clipping 
áp dụng bằng cách thêm một dòng để giới hạn gradient lại trước khi thực hiện update 
```python
torch.nn.utils.clip_grad_norm_(model.parameters(), max_norm=1.0)
```

## Bật bidirectional 

## Áp dụng TPP (temporal pyramid pooling)
```python
import torch.nn.functional as T

```