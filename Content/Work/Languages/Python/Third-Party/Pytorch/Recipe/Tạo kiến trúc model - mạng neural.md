
khởi tạo một kiến trúc model với [[Weight (Trọng Số) w]] và [[Bias]] cùng với hàm định nghĩa của [[Forward Propogation (Lan Truyền Xuôi)]] 

```python
class LinearRegressionModel():
    def __init__(self):
        super().__init__()

        self.weights = nn.Parameter(torch.randn(1))
        self.bias = nn.Parameter(torch.randn(1))
        
    def forward(self): 
        return self.weights * x + self.bias


```