thêm ràng buộc: 
```SQL
alter table <tên_bảng> 
add <ràng_buộc> (<tên_cột>)
```

#### thêm ràng buộc khóa chính
trước tiên phải thay đổi kiểu dữ liệu của cột thành [[NOT NULL]] ([[Thay đổi kiểu dữ liệu cột]]) rồi mới thêm ràng buộc [[Khóa chính]] cho cột đó được
