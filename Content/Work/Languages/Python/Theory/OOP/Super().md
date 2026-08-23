dùng để sử dụng [[Method (Phương thức)]] của lớp cha ngay trong lớp con

```python
class DongVat:
    def __init__(self, ten):
        self.ten = ten

class CoVu(DongVat):
    def __init__(self, ten, loai):
        super().__init__(ten)
        self.loai = loai

dog = CoVu("khoai", "cho")
print(dog.ten, ",", dog.loai)
```