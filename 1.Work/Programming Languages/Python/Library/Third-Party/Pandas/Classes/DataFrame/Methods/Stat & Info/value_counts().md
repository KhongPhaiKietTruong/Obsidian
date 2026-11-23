dùng để đếm tần suất xuất hiện của mỗi giá trị 
```python
df['animal'].value_counts(dropna=True, sort)
```
trả về một [[Series]] mới với index là các giá trị duy nhất tương ứng với tuần suất xuất hiện của nó 