thêm ràng buộc: 
```SQL
ALTER TABLE <tên_bảng> 
ADD <tên_ràng_buộc> (<tên_cột>)
```

thêm ràng buộc khóa chính
trước tiên phải thêm ràng buộc [[NOT NULL]] cho cột đó rồi mới thêm ràng buộc [[Khóa chính]] cho cột đó được
```
alter table <tên_bảng>
add 
```