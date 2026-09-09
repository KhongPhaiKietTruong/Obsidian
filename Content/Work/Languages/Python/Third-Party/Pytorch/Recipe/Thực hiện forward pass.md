ta thực hiện forward pass bằng cách truyền [[Training Set (Tập Huấn Luyện)]] vào [[Instance (Thể hiện)]] của cái class [[Neural Network (Mạng Neural)]] mà ta đã định nghĩa (cái mà kế thừa từ [[nn.Module]], ...) 

```python
class LinearRegression(nn.Module):
​	# code định nghĩa cấu trúc model
​	# code định nghĩa forward pass 

model = LinearRegression()
y_preds = model(X)
```

gọi model(X) cũng là gọi đến [[Special method - Magic method - Dunder method]] \_\_call__() của nn.Module, trong method nó sẽ gọi đến forward(X) để thực hiện [[Forward Propogation (Lan Truyền Xuôi)]]
