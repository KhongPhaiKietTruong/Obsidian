dùng để đọc dữ liệu từ file định dạng .csv và trả về một [[DataFrame]].

Các tham số thường dùng:
* sep / delimiter: Ký tự phân tách các cột, mặc định là ,.
* header: Chỉ số hàng được dùng làm tên cột (mặc định là 0). Nếu file không có hàng tiêu đề, đặt header=None.
* names: Danh sách tên các cột tự định nghĩa khi dùng header=None.
* index_col: Cột được chọn làm index cho DataFrame.
* usecols: Danh sách các cột muốn đọc để tối ưu bộ nhớ.

Ví dụ:
```python
# Đọc file cơ bản
df = pd.read_csv('data.csv')

# Đọc file phân tách bằng dấu chấm phẩy (;), chỉ lấy một số cột và chọn cột 'id' làm index
df = pd.read_csv('data.csv', sep=';', index_col='id', usecols=['id', 'name', 'age'])
```