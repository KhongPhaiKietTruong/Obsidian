
khởi tạo một kiến trúc model với [[Weight]] và [[Bias]] cùng với hàm định nghĩa của [[Forward Propogation]] 
trong [[Constructor]], ta sẽ định nghĩa [[Neural Network]] này sẽ có những layer gì, trong function forward thì ta định nghĩa cách mà từng batch được truyền qua từng layer 

```python
class LinearRegressionModel():
    def __init__(self):
        super().__init__()

        self.layer1 = nn.Linear(n, 2)
        self.layer2 = nn.Linear(2, 1)
        
    def forward(self, x): 
    ​	X = layer1(x)
        X = torch.relu(x)
        X = layer2(x)
    ​	return layer2(layer1(x))
```

lưu ý: n phải bằng với [[Features]] của mỗi mẫu dữ liệu 