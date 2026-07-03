trả về các thông tin thống kê mô tả của [[DataFrame]] như: số lượng giá trị không null (count), giá trị trung bình ([[Mean value (Average value)]]), độ lệch chuẩn ([[Standard deviation|std]]), giá trị nhỏ nhất (min), các [[Quantile|mốc tứ phân vị]]  25%, 50% (trung vị), 75%, và giá trị lớn nhất (max).
* Mặc định, phương thức này chỉ thống kê các cột có kiểu dữ liệu số.
* Để thống kê tất cả các cột (bao gồm cả cột dạng chuỗi/category), sử dụng tham số include='all'.

Ví dụ:
```python
# Thống kê mô tả các cột số
print(df.describe())

# Thống kê mô tả toàn bộ các cột (bao gồm cả Object/String)
print(df.describe(include='all'))
```