cũng tương tự với [[Inline Table-Valued Function (iTVF)]] nhưng thay vì chỉ thực hiện một câu lệnh là select thì hàm này cho phép thực hiện thêm nhiều câu lệnh khác nữa 

```sql
CREATE FUNCTION dbo.fn_MSTVF(@MaBN INT)
RETURNS @Result TABLE
(
    MaBN INT,
    HoTen NVARCHAR(100)
)
AS
BEGIN
    INSERT INTO @Result
    SELECT MaBN, HoTen
    FROM BENHNHAN
    WHERE MaBN = @MaBN;
    -- can have more statements here
    RETURN;
END;

-- su dung 
SELECT *
FROM dbo.fn_MSTVF(1);
```