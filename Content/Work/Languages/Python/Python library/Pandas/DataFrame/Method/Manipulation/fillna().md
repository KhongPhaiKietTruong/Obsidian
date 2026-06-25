dùng để thay thế giá trị NaN thành giá trị mà ta chỉ định

```python
df.fillna(0) #thay thế tất cả giá trị NaN của bảng thành 0

df['tuoi'].fillna(df['tuoi'].mean()) # thay thế các giá trị NaN trong cột tuổi bằng giá trị trung bình của cột đó
```