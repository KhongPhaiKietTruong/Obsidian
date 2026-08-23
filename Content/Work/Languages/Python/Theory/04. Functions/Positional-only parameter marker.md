When using '/', all the parameters to the left of '/' must be passed positionally , not by keyword

Example:
```python
def divide(a, b, /):
    return a / b
```

Correct calls:
```python
divide(10, 2)
```

Incorrect call:
```python
divide(a=10, b=2)
```