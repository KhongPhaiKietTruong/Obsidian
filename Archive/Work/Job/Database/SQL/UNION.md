dùng để trả về một danh sách tổng hợp

```sql
SELECT first_name AS people

FROM Employee

UNION

SELECT client_name

FROM Client;
```