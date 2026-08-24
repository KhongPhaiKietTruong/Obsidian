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