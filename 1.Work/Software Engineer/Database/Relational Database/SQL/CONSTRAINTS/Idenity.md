```sql
idenity(start, step)
```
giá trị mặc định của start và step là 1, 1 nếu không khai báo cụ thể

[[Constraint (Ràng Buộc)]] này giúp cột mang giá trị tự động tăng dần lên theo step với giá trị bắt đầu là start 
```sql
CREATE TABLE Persons ( 
​	ID int IDENTITY PRIMARY KEY, 
​	LastName varchar(255) NOT NULL, 
​	Age int CHECK (Age>=18), 
​	City varchar(255) DEFAULT 'HN' 
);
```

