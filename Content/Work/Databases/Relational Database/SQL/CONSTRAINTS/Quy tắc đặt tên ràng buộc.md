
```sql 
<loại ràng buộc>_<tên bảng hiện tại><tên bảng đích>
```
ví dụ
```sql
CREATE TABLE SanPham (
    MaSP int,
    MoTa varchar(100),

    CONSTRAINT PK_SanPham PRIMARY KEY (MaSP),
    CONSTRAINT DF_SanPham_MoTa DEFAULT 'unknown' FOR MoTa
);
```

[[Khóa chính]] thì bỏ phần tên [[Table (Bảng)|bảng]] đích