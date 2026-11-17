gần tương tự như [[loc]], chỉ khác ở chỗ iloc thì truy cập thông qua số index (chỉ số nguyên) còn loc thì theo nhãn.

Ví dụ:
```python
# Lấy hàng đầu tiên (chỉ số 0) dưới dạng Series
print(df.iloc[0])

# Lấy giá trị của hàng đầu tiên, cột thứ hai (chỉ số 1)
print(df.iloc[0, 1])

# Cắt dữ liệu (slicing): lấy 3 hàng đầu và 2 cột đầu
print(df.iloc[0:3, 0:2])
```
