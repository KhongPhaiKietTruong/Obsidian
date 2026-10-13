thêm ràng buộc: 
```SQL
alter table <tên_bảng> 
add <ràng_buộc> (<tên_cột>)
```

lưu ý: đối với ràng buộc [[Check]] thì trong biểu thức điều kiện của nó đã có luôn tên cột nên không cần thành phần (<tên_cột> nữa)
```sql
alter table hoc_sinh
add check (tuoi >= 18);
```
#### thêm ràng buộc khóa chính
trước tiên phải thay đổi kiểu dữ liệu của cột thành [[Not null]] ([[Thay đổi kiểu dữ liệu cột]]) rồi mới thêm ràng buộc [[Khóa chính]] cho cột đó được

lưu ý: đôi lúc có code sẽ là "add constraint", từ "constraint" là không bắt buộc và có thể có hoặc không 
