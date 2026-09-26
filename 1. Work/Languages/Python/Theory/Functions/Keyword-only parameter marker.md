tất cả những [[Parameters (Tham số)]] nằm sau dấu "\*" phải được truyền vào với keyword, còn những tham số đằng trước thì muốn truyền theo kiểu nào cũng được 

```python
def greet(name, phone, sex *, age):
    print(f"{name} is {age} years old.")

greet("Alice", age=25)   # ✅ Correct
greet("Alice", 25)       # ❌ Error
```

