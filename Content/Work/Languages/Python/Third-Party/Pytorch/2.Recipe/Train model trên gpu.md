để có thể train model trên gpu thì ta phải chuyển [[Instance (Thể hiện)]] của model và các batch (dữ liệu truyền vào model) vào gpu bằng cách dùng [[Content/Work/Languages/Python/Third-Party/Pytorch/torch/nn/Classes/nn.Module/Method/to()|to()]] 

ví dụ
```python
model = LinearRegression.to(device)

for X_batch, y_batch in train_loader:
    X_batch = X_batch.to(device)
    y_batch = y_batch.to(device)

    y_pred = model(X_batch)
    ...
```