là một đoạn mã được thực thi tự động khi có một sự kiện nào đó (thêm bảng ghi, xóa bảng ghi, ...) xảy ra lên [[Table (Bảng)]] hoặc View  
cú pháp tạo một trigger
```sql
create or alter trigger <tên_trigger>
on <tên_bảng>
<before|after|instead of> <insert|update|delete>
as
begin
-- code 
end
```

trong trigger, nó cung cấp cho ta "inserted" tương ứng với bảng vừa được insert hoặc update và "deleted" tương ứng với bảng bị xóa

code ví dụ
```sql
CREATE OR ALTER TRIGGER trg_kiem_tra_ngay_mua
ON hoa_don
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN dbo.khach_hang k
            ON i.ma_kh = k.ma_kh
        WHERE i.ngay_mua <= k.ngay_sinh
    )
    BEGIN
        RAISERROR(N'Ngày mua phải sau ngày sinh.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
GO
```