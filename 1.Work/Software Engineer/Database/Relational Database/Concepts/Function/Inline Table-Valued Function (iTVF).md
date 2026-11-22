mà một [[Function (Hàm]] và trong function này chỉ thực hiện một câu lệnh select, trả về một bảng, khá tương tự giống với [[1.Work/Software Engineer/Database/Relational Database/Concepts/View]] nhưng cho phép nhận vào [[Parameters]] 

```sql
CREATE FUNCTION dbo.fn_PatientsByGender(@Gender NVARCHAR(10))
RETURNS TABLE
AS
RETURN
(
    SELECT MaBN, HoTen, GioiTinh
    FROM BENHNHAN
    WHERE GioiTinh = @Gender
);

-- su dung
SELECT *
FROM dbo.fn_PatientsByGender(N'Nam');
```