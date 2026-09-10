```python
loss_fn = nn.MSELoss()
loss = loss_fn(y_pred, y_true) 
```

loss_fn làm một [[Function (Hàm)]] và sẽ trả về [[Giá trị trung bình]] của các [[Loss function (Hàm Mất Mát)]] của các mẫu trong từng batch 

nghĩa là biến loss sẽ chứa trung bình cộng các loss của các mẫu trong từng batch truyền vào:
$$
loss = \sum_{i=1}^{B} loss_{fn}(\hat{y}, y)
$$
lưu ý: loss_fn sẽ trả về một [[Tensor]] (tensor này có 1 phần tử)