```python
loss_fn = nn.MSELoss()function
loss = loss_fn(y_pred, y_true) 
```

loss_fn làm một function và sẽ trả về trung bình cộng của các loss của các mẫu trong từng batch 
nghĩa là biến loss sẽ chứa trung bình cộng các loss của các mẫu trong từng batch truyền vào:
$$
loss = \sum_{i=1}^{B} loss_{fn}(\hat{y}, y)
$$
