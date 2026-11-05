```sql
create database <tên_database>;
```
ta có thể tạo database với các tham số bằng cách
```sql
create database <tên_database> (
​	name = <tên_database> (tên này được sql sử dụng nội bộ)
​	filename = <đường_dẫn_chứa_file>
​	size = <kích_thước_cấp_phát_ban_đầu>
​	maxsize = <kích_thước_tối_đa>
​	filegrowth = <kích_thước_phân_bổ_mỗi_lần_nới_rộng> 
)
```
ví dụ
```sql 
CREATE DATABASE Movies
ON PRIMARY (
    NAME = Movies_data1,
    FILENAME = 'C:\Movies\data1.mdf'
    SIZE = 25MB,
    MAXSIZE = 40MB,
    FILEGROWTH = 1MB
),
(
    NAME = Movies_data2,
    FILENAME = 'D:\Movies\data2.ndf'
)
LOG ON (
    NAME = Movies_log,
    FILENAME = 'C:\Movies\Movies_log.ldf'
);
```