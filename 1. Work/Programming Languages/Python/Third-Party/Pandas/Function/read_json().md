dùng để đọc dữ liệu từ file hoặc chuỗi định dạng JSON và trả về một [[DataFrame]].

Các tham số thường dùng:
* orient: Chỉ định định dạng cấu trúc của file JSON (ví dụ: 'records', 'split', 'index', 'columns', 'values').

Ví dụ:
```python
# Đọc file json với cấu trúc mặc định hoặc dạng danh sách bản ghi (records)
df = pd.read_json('data.json')

# Đọc file json với định dạng cụ thể
df = pd.read_json('data.json', orient='records')
```