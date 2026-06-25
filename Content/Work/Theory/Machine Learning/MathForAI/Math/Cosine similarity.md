dùng để tính độ tương đồng giữa hai vector
trả về một số thực nằm trong khoảng từ \[-1 ;1]

-1: đối lập nhau
0: không liên quan
1: giống nhau

công thức tính:

tích vô hướng / tích độ dài 

```
cos = np.dot(a, b) / (np.linalg.norm(a) * np.linalg.norm(b))
```