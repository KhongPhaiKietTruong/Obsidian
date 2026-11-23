[[Method]] này được sử dụng cho [[Tensor]] chỉ có một phần tử, nó trả về giá trị của phần tử đó 
```python
a = torch.Tensor([3.14])
a.item()
# output:
# 3.14... 
```
thường dùng cho output của [[Loss Function]]
```python
loss = loss_fn(logits, y_batch)
train_loss += loss.item()
```