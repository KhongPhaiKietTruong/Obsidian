
## Bật pin_memory trong data_loader 
## Bật non_blocking trong to() 
## AMP (Automatic Mixed Precision)
dùng để tăng tốc độ train và inference 
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


# --- TPP GỌN TRONG 1 DÒNG DÙNG F.adaptive_avg_pool1d ---
            tpp_feat = torch.cat([F.adaptive_avg_pool1d(rnn_out, lvl).flatten(1) for lvl in [1, 
            ￹2, 4]], dim=1)