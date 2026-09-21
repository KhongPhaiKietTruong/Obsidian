dùng để truy cập vào biến được bảo vệ, đảm bảo không thể tùy ý thay đổi biến đó từ bên ngoài 
```python
class Customer:
    def __init__(self, name: str, balance: int):
        self._name = name
        self.__balance = balance

    @property
    def balance(self):
        return self.__balance


customer1 = Customer("kiet", 200)
print(customer1.balance)

```