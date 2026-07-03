hàm array() giúp tạo một [[Arrays (Mảng)]] trong numpy

nhận vào các tham số
- object: là một iterable (thường là [[List]] và [[Tuple]], chấp nhận list và tuple xen lẫn nhau)
- dtype: kiểu dữ liệu mong muốn, không khai báo thì np sẽ tự suy luận, nếu vừa có số nguyên và số thực thì nó cho là số thực
- ndmin: số chiều, dùng để tạo "lớp vỏ bọc" 

```python 
import numpy as np
a = np.array([1, 2, 3, 4])
print(a)

#output: [1, 2, 3, 4]
```

