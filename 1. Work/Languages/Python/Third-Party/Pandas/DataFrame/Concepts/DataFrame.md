thường dùng để tạo một [[1. Work/Theory/OOP/Theory/Object|Object]] của class DataFrame (một cái bảng), có thể nhận vào nhiều kiểu dữ liệu, nhưng thường thì là một [[Dictionary]] 

```python
df = pd.DataFrame({
    'ten': ['kiet', 'giau', 'tung'],
    'tuoi': [19, 22, 29],
    'nguoi yeu': [0, 1, 0]
})
```

mỗi DataFrame sẽ có các [[Index Labels]] và [[Column Labels]] 