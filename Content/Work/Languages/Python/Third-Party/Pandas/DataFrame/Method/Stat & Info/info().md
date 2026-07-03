cho biết thông tin tổng quan của [[DataFrame]] bao gồm:
* Số lượng bản ghi (hàng) và khoảng chỉ số index.
* Số lượng cột.
* Tên các cột, kiểu dữ liệu của từng cột.
* Số lượng giá trị phi trống (non-null counts) của mỗi cột (từ đó suy ra số lượng dữ liệu bị trống).
* Lượng bộ nhớ RAM được sử dụng (memory usage).

Ví dụ:
```python
# Xem thông tin tổng quan của DataFrame
df.info()
```