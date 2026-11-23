dùng để tính giá trị trung bình của mỗi chiều 
cú pháp:
```python
np.mean(<array_name>, axis)
```

```python
a = np.array([1, 2, 3, 4, 5])
print(np.mean(a))
output : 7.5
```

```python
a = np.array([[1, 2], [3, 4]])

print(np.mean(a, axis=0))
output: [2, 3]

print(np.mean(a, axis=1))
output: [1.5, 3.5]
```