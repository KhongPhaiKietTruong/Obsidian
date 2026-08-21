dùng để chọn [[Table (Bảng)|bảng]] để xóa hàng
thường đứng trước [[WHERE]]

```SQL
DELETE FROM student
WHERE major IN ('CNTT', 'ATTT') OR major IS NULL 
```
