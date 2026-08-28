là một đoạn mã được thực thi tự động khi có một sự kiện nào đó (thêm bảng ghi, xóa bảng ghi, ...) xảy ra lên [[Table (Bảng)]] hoặc View  
cú pháp tạo một trigger
```sql
create or alter trigger <tên_trigger>
on <tên_bảng>
<before|after|instead of> <insert|update|delete>

```