DataFrame.reset_index() dùng để đặt lại index cho df, mặc định sẽ biến index cũ thành một cột mới trong df, truyền đối số cho tham số drop để giải quyết việc này 
```python
df = df.reset_index(drop=True)
```
từ 
```
    name    age
5   Bình     21 
6  Cường     22
```
thành
```
    name    age
0   Bình     21
1  Cường     22
```