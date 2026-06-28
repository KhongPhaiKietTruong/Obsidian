When using '\*', all the parameters to the right of '\*' must be passed as keyword arguments , not by position

```python
def greet(name, *, age):
    print(f"{name} is {age} years old.")

greet("Alice", age=25)   # ✅ Correct
greet("Alice", 25)       # ❌ Error
```

