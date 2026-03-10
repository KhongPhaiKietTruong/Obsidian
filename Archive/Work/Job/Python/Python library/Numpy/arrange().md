các thông số: np.arrange(start, stop, step, dtype=None)
- start: giá trị bắt đầu, giá trị mặc định là 0
- stop: giá trị kết thúc
- step: bước nhảy
- dtype: mặc định tự suy luân

```python
arr = np.arrange(7)
output: arr = [0, 1, 2, 3, 4, 5, 6, 7]

```

```python
arr = np.arrange(3, 6)
output: arr = [3, 4, 5]

```

```python
arr = np.arrange(3, 6, 2)
output: arr = [3, 5]

```