```sql
CREATE TABLE <table_name> (
	<tên_cột_1> <kiểu_dữ_liệu> <ràng_buộc>,
	...
	<tên_cột_2> <kiểu_dữ_liệu> <ràng_buộc>,
);
```

ngoài ra, ta còn có thể đặt tên cho ràng buộc (để đặt tên cho ràng buộc, kham thảo [[Quy tắc đặt tên ràng buộc]])
```sql
CREATE TABLE <table_name> (
	<tên_cột_1> <kiểu_dữ_liệu>,
	...
	<tên_cột_2> <kiểu_dữ_liệu>,
	
	constraint <tên_ràng_buộc> <ràng_buộc> 
);
```

ví dụ:
```sql 
CREATE TABLE SanPham (
    MaSP int,
    MoTa varchar(100),

    CONSTRAINT PK_SanPham PRIMARY KEY (MaSP),
    CONSTRAINT DF_SanPham_MoTa DEFAULT 'unknown' FOR MoTa
);
```