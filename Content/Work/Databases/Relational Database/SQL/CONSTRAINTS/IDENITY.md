```sql
idenity(start, step)
```
ràng buộc này giúp cột mang giá trị tự động tăng dần lên theo step với giá trị bắt đầu là start 
```sql
CREATE TABLE Persons ( 
​	ID int IDENTITY(1,1) PRIMARY KEY, 
​	LastName varchar(255) NOT NULL, 
​	FirstName varchar(255) NOT NULL, 
​	Age int CHECK (Age>=18), 
​	City varchar(255) DEFAULT 'HN' 
);
```