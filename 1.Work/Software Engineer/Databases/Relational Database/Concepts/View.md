là một bảng ảo được tạo nên từ một truy vấn (câu lệnh select) 
có tác dụng:
- tránh phải viết phải câu truy vấn dài nhiều lần mà chỉ tạo rồi gọi 
- tránh hiển thị thông tin riêng tư, ví dụ table NhanVien có các cột là ID, Ten, Luong, Tuoi bình thường thì ta cần phải giấu Luong nên ta sẽ tạo view có tên là vw_NhanVien_public rồi từ đó sử dụng view này 
thay đổi dữ liệu trên view cũng sẽ thay đổi dữ liệu gốc 