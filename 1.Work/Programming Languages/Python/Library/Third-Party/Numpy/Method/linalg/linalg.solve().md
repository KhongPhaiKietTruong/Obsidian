dùng để giải một hệ phương trình tuyến tính
giả sử ta có $A=\begin{bmatrix}-1 & 3 \\ 3 & 2\end{bmatrix}$ và $B=\begin{bmatrix}7 & 1\end{bmatrix}$
ma trận A chứa các hệ số của x, ma trận B chứa các hệ số sau dấu phẩy

```python
c = np.linalg.solve(A, B)
print(c)
#output:
#c = [-1 2]
```