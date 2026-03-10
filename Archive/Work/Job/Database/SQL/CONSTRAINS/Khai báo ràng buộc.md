
Khai báo ở mức cột

```sql
CREATE TABLE NhanVien (
    ID int PRIMARY KEY,          
    TenNV varchar(50) NOT NULL,  
    Tuoi int CHECK (Tuoi > 18)   
);
```

Khai báo ở mức bảng

```sql
CREATE TABLE DonHang (
    DonHangID int,
    SanPhamID int,
    SoLuong int,
    
    CONSTRAINT PK_DonHang PRIMARY KEY (DonHangID),         
    CONSTRAINT FK_SanPham FOREIGN KEY (SanPhamID) REFERENCES SanPham(ID), 
    CONSTRAINT CHK_SoLuong CHECK (SoLuong > 0)             
);
```