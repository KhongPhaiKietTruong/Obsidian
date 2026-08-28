lệnh này có thể thêm một cột vào [[Table (Bảng)]], thêm các ràng buộc, thêm chỉ mục (index)

THÊM CỘT:
```sql
ALTER TABLE <tên_bảng>
ADD COLUMN <tên_cột> <kiểu_dữ_liệu> ;
```

có thể xếp vị trí của một mới tại một vị trí cụ thể bằng cách sử dụng AFTER <COLUMN_NAME>
```SQL
ALTER TABLE <tên_bảng>
ADD COLUMN <tên_cột> <kiểu_dữ_liệu> AFTER <tên_cột>;
```

