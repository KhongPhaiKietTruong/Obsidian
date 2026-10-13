có thể dùng để thay đổi kiểu dữ liệu, thay đổi ràng buộc 

cú pháp:
```sql
MODIFY <COLUMN_NAME> <NEW_DATATYPE> <NEW_CONSTRAIN>
```

Lưu ý: khi dùng lệnh modify để thay đổi datatype mà không thay đổi constrain thì cần ghi lại constrain, do modify định nghĩa lại hoàn toàn cột đó