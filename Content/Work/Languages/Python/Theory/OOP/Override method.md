```python
from typing import override


class Animal:
    def make_sound(self):
        pass

class Dog(Animal):
    @override
    def make_sound(self):
        print("woof woof")

dog1 = Dog()
dog1.make_sound()
```