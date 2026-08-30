```python
nn.Linear(in_features, out_features, bias=True)
```
đây là một [[Class (Lớp)]] dùng để khởi tạo một [[Linear - Dense - Fully Connected Layer|linear layer]]  với:
- in_features là số lượng [[Neural|neural]] đầu vào
- in_features là số lượng [[Neural|neural]] đầu ra
- bias: bật tắt [[Bias]]
code mẫu:
```python 
x = torch.tensor([200.0, 17.0])
model = nn.Sequential(
    nn.Linear(2, 3),
    nn.Sigmoid(),
    nn.Linear(3, 1),
    nn.Sigmoid()
)
output = model(input)
print(output)
```