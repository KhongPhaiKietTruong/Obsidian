ta thực hiện forward pass bằng cách truyền [[Training Set (Tập Huấn Luyện)]] vào [[Instance (Thể hiện)]] của cái class [[Neural Network (Mạng Neural)]] mà ta đã định nghĩa (cái mà kế thừa từ [[nn.Module]], ...) 

```python
class LinearRegression(nn.Module):
​	# code 

model = LinearRegression()
y_preds = model(X)
```