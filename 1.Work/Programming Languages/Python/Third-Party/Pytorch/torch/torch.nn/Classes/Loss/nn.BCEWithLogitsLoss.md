nn.BCEWithLogitsLoss đã có sẵn hàng tính [[Sigmoid]] bên trong, do đó nhận vào giá trị [[Logits]] ([[Pre-Activation Value]]) và cho ra giá trị [[Loss Function]]

```python
loss = nn.BCEWithLogitsLoss(logits, y_train)
```