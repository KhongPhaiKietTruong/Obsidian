
khởi tạo một kiến trúc model với [[Weight]] và [[Content/Work/Theory/Machine Learning/Fundamentals/Quantities/Bias]] cùng với hàm định nghĩa của [[Forward Propogation]] 
trong [[Constructor (Hàm khởi tạo)]], ta sẽ định nghĩa [[Neural Network]] này sẽ có những layer gì, trong function forward thì ta định nghĩa các mà batch được truyền qua từng layer 

```python
class LinearRegressionModel():
    def __init__(self):
        super().__init__()

        self.layer1 = nn.Linear(n, 2)
        self.layer2 = nn.Linear(2, 1)
        
    def forward(self): 
    ​	X = layer1(X)
        X = torch.relu(X)
        X = layer2(X)
    ​	return X 
```

lưu ý: n phải bằng với [[Features]] của mỗi mẫu dữ liệu 