dùng để tạo một ma trận có kích thước và kiểu dữ liệu giống ma trận ta truyền vào nhưng giá trị do ta quyết định

```python
import numpy as np

# Tạo mảng mẫu
x = np.array([[1, 2, 3], 
              [4, 5, 6]])

# 1. Tạo mảng mới cùng shape/dtype nhưng chứa toàn số 7
res = np.full_like(x, 7)
print(res)
# Output:
# [[7 7 7]
#  [7 7 7]]
```