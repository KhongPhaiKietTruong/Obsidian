df.drop() trả về một bản sao của [[DataFrame]] gốc sau khi loại bỏ các hàng hoặc các cột
code xoá cột name và age: 
```python
df = df.drop(columns=['name', 'age'], axis=1)
```

