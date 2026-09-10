
khởi tạo một kiến trúc model với [[Weight (Trọng Số) w]] và [[Bias]] cùng với hàm định nghĩa của [[Forward Propogation (Lan Truyền Xuôi)]] 

```python
class LinearRegressionModel():
    def __init__(self):
        super().__init__()

        self.layer1 = nn.Linear(2, 2)
        self.layer2 = nn.Linear(2, 1)
        
    def forward(self): 
    ​	
    ​	return self.weights * x + self.bias


```