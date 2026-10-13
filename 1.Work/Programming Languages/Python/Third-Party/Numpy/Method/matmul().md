trả về tích của hai ma trận (giống i rang dùng '@')
```python
A = np.array([[4, 9, 9], [9, 1, 6], [9, 2, 3]])
B = np.array([[2, 2], [5, 7], [4, 4]])

C = np.matmul(A, B)
or
C = A @ B

print(C)
#output: 
#array([[ 89, 107],
#       [ 47,  49],
#       [ 40,  44]])
```