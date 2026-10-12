```python
class Customer:
    def __init__(self, name: str, balance: int):
        self._name = name
        self.__balance = balance

    @balance.setter
    def balance(self, balance):
        if (balance<0):
            print("so du khong the am")
        else:
            self.__balance = balance

customer1 = Customer("kiet", 200)
customer1.balance = 150
print(customer1.balance)

```