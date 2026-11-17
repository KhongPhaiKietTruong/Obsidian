
Instance là một [[1.Work/OOP/Theory/Object|Object]] cụ thể của một [[1.Work/OOP/Theory/Class|Class]], 
ví dụ: Dog là instance của class Animal nếu như Dog là một Object được khởi tạo từ lớp Animal 
```python
dog = animal(name='xi ngau', age=4)
```

một instance có thể được gọi như một [[Function]] nếu như class của nó có định nghĩa [[Dunder method]] \_\_call\_\_() 
ví dụ:
```python
from torchvision.transforms import v2
img = v2.ToImage()(img)
```
với:
- v2.ToImage() là một instance 

