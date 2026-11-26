
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
