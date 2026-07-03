hàm dùng để tính tích vô hướng của hai trận [[Vector]]
**hoặc**
tính tích của hai [[Matrix |ma trận]]  (cũng có thể sử dụng "@")

tích vô hướng:
```python
import numpy as np

a = np.array([1, 2, 3])
b = np.array([4, 5, 6])

# Tính: (1*4) + (2*5) + (3*6) = 4 + 10 + 18 
result = np.dot(a, b) 
print(result)  # Output: 32
```

tích hai ma trận
```python
A = np.array([[1, 2], 
              [3, 4]]) # Kích thước 2x2

B = np.array([[5, 6], 
              [7, 8]]) # Kích thước 2x2

result = np.dot(A, B)
print(result)
# Output:
# [[19 22]
#  [43 50]]
```