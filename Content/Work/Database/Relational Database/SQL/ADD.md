lệnh này có thể thêm một cột vào table, thêm các ràng buộc, thêm chỉ mục (index)

THÊM CỘT:
```sql
ALTER TABLE student
ADD COLUMN email VARCHAR(20);
```

có thể xếp vị trí của một mới tại một vị trí cụ thể bằng cách sử dụng AFTER <COLUMN_NAME>
```SQL
ALTER TABLE student
ADD COLUMN email VARCHAR(20) AFTER name;
```

THÊM RÀNG BUỘC: 
```SQL
ALTER TABLE student 
ADD PRIMARY KEY <COLUMN_NAME>
```

THÊM CHỈ MỤC:
...