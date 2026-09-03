#### các vấn đề cần giải quyết: 
##### thiết kế database: các tảng, các đối tượng đã ổn chưa ?
đề xuất: 
- thêm bảng NHANVIEN: MaNV (PK) HoTen NgaySinh SDT ChucVu
- ở bảng LICHKHAM: bỏ lí do khám (vô khám rồi bs mới hỏi), gộp ngày khám và giờ khám lại thành kiểu dữ liệu DATETIME (gồm cả ngày và giờ), thêm thời gian khám dự kiến (vd 30p) (để thực hiện tính năng trùng lịch khám), 
- ở LICHKHAM và PHIEUKHAM có cả hai cột là ngaykham, nên đặt thành ngayhen và ngaykhamthucte
- ở HOADON: tại sao cần MaPK ?
- ở THUOC: nên thêm trạng thái, vì thuốc có thể hết 

