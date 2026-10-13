[[Constraint (Ràng Buộc)]] này dùng để tạo ra các điều kiện cho cột ví dụ như giá trị phải lớn hơn n, bé hơn n, nằm trong khoảng nào hoặc chỉ được nhận những giá trị nào
```sql
create table student (
​	age int check (age >= 18)
​	sex varchar(10) check (sex in ('male', 'female', 'other'))
);
```