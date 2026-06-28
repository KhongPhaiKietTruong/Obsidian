thường dùng để tạo một instance của class DataFrame (một cái bảng), có thể nhận vào nhiều kiểu dữ liệu, nhưng thường thì là một [[Dictionary]] 

```python
df = pd.DataFrame({
    'ten': ['kiet', 'giau', 'tung'],
    'tuoi': [19, 22, 29],
    'nguoi yeu': [0, 1, 0]
})
```