phân công: 
1 người làm front-end (React?)
1 người làm database
1 người làm backend
1 viết báo cáo 
#### các vấn đề cần giải quyết: 
##### thiết kế database: các tảng, các đối tượng đã ổn chưa ?
đề xuất: 
- thêm bảng NHANVIEN MaNV (PK) HoTen NgaySinh GioiTinh SDT DiaChi ChucVu TrangThai
- ở bảng LICHKHAM: bỏ lí do khám (vô khám rồi bs mới hỏi), gộp ngày khám và giờ khám lại thành kiểu dữ liệu DATETIME (gồm cả ngày và giờ), thêm thời gian khám dự kiến (vd 30p) (để thực hiện tính năng trùng lịch khám), 
- ở LICHKHAM và PHIEUKHAM có cả hai cột là ngaykham, nên đặt thành ngayhen và ngaykhamthucte
- ở HOADON: tại sao cần MaPK ?
- ở THUOC: nên thêm trạng thái, vì thuốc có thể hết 
- ở CT_THUOC nên thêm DONGIA vì giá thuốc có thể thay đổi, THUOC.DONGIA = giá thuốc hiện tại, CT_THUOC.DONGIA = giá thuốc lúc được kê 

##### View 
lịch khám chi tiết dành cho: admin, lễ tân, bác sĩ
```sql 
CREATE VIEW vw_LichKhamChiTiet
AS
SELECT
    lk.MaLich,
    lk.NgayKham,
    lk.GioKham,
    lk.LyDoKham,
    lk.TrangThai,

    bn.MaBN,
    bn.HoTen AS TenBenhNhan,
    bn.SoDienThoai AS SDTBenhNhan,

    bs.MaBS,
    bs.HoTen AS TenBacSi,

    ck.MaCK,
    ck.TenCK
FROM LICHKHAM lk
JOIN BENHNHAN bn
    ON lk.MaBN = bn.MaBN
JOIN BACSI bs
    ON lk.MaBS = bs.MaBS
JOIN CHUYENKHOA ck
    ON bs.MaCK = ck.MaCK;
```
lịch sử khám bệnh dành cho bác sĩ
```sql
CREATE VIEW vw_LichSuKhamBenh
AS
SELECT
    pk.MaPK,
    bn.MaBN,
    bn.HoTen AS TenBenhNhan,

    bs.MaBS,
    bs.HoTen AS TenBacSi,

    pk.NgayKham,
    pk.TrieuChung,
    pk.KetQua,
    pk.ChanDoan,
    pk.GhiChu,
    pk.PhiKham
FROM PHIEUKHAM pk
JOIN LICHKHAM lk
    ON pk.MaLich = lk.MaLich
JOIN BENHNHAN bn
    ON lk.MaBN = bn.MaBN
JOIN BACSI bs
    ON lk.MaBS = bs.MaBS;
```

##### Stored Procedure

##### Indexes 

##### Transaction 

##### Role 
| Function                   | Admin | Doctor       | Receptionist | Cashier |
| -------------------------- | ----- | ------------ | ------------ | ------- |
| Manage employees           | CRUD  | ❌            | ❌            | ❌       |
| Manage doctors             | CRUD  | Read         | Read         | Read    |
| Manage specialties         | CRUD  | Read         | Read         | Read    |
| Manage patients            | CRUD  | Read/Update  | CRUD         | Read    |
| Create appointments        | ✅     | ❌            | ✅            | ❌       |
| Update appointment status  | ✅     | ✅            | ✅            | ❌       |
| View appointments          | ✅     | Own patients | ✅            | ❌       |
| View appointments          | ✅     | Own patients | ✅            | ❌       |
| Create examination records | ✅     | ✅            | ❌            | ❌       |
| Update diagnosis           | ✅     | ✅            | ❌            | ❌       |
| Create prescriptions       | ✅     | ✅            | ❌            | ❌       |
| Manage medicines           | CRUD  | Read         | ❌            | ❌       |
| Assign medical services    | ✅     | ✅            | ❌            | ❌       |
| Manage service catalog     | CRUD  | Read         | Read         | Read    |
| View invoices              | ✅     | Read         | Read         | ✅       |
| Create invoice             | ✅     | ❌            | ❌            | ✅       |
| Process payment            | ✅     | ❌            | ❌            | ✅       |
| View payment history       | ✅     | ❌            | ❌            | ✅       |
| System/user management     | ✅     | ❌            | ❌            | ❌       |

