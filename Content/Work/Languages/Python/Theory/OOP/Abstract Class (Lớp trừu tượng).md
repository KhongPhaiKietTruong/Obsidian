tham khảo khái niệm lớp trừu tượng ở [[Content/Work/Theory/OOP/Theory/Abstract Class (Lớp trừu tượng)|Abstract Class (Lớp trừu tượng)]]

```python
from abc import ABC, abstractmethod

class AbstractClass(ABC):
    @abstractmethod
    def test(self):
        pass

class ClassTest(AbstractClass):
    def test(self):
        print("test")

testInstance = ClassTest()
testInstance.test()
```

