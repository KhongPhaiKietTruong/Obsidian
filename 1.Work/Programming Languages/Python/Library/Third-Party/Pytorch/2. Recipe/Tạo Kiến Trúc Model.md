
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

> [!WARNING] 
> Contents
lưu ý: n phải bằng với [[Features]] của mỗi mẫu dữ liệu 

> [!NOTE] 
> Không thể sử dụng trực tiếp nn.X trong hàm forward mà phải định nghĩa nó trong \_\_init\_\_() nếu không trọng số trên các lớp sẽ không được cập nhật 
