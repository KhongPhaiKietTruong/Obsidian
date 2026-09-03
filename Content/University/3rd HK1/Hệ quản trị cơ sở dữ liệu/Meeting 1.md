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
- ở THUOC: nên thêm trạng thái và số lượng còn lại , vì thuốc có thể hết hoặc hết hạn
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
chi tiết đơn thuốc dành cho bác sĩ
```sql
CREATE VIEW vw_ChiTietDonThuoc
AS
SELECT
    dt.MaDon,
    dt.MaPK,
    dt.NgayKe,

    ct.MaThuoc,
    t.TenThuoc,
    t.DonViTinh,

    ct.SoLuong,
    ct.LieuDung,
    ct.SoLanDung,
    ct.HuongDan
FROM DONTHUOC dt
JOIN CT_DONTHUOC ct
    ON dt.MaDon = ct.MaDon
JOIN THUOC t
    ON ct.MaThuoc = t.MaThuoc;
```
dành cho thu ngân
```sql
CREATE VIEW vw_TinhTrangHoaDon
AS
SELECT
    hd.MaHD,
    hd.MaPK,
    hd.NgayLap,
    hd.TongTien,
    hd.TrangThai,

    COALESCE(SUM(tt.SoTien), 0) AS DaThanhToan,

    hd.TongTien
        - COALESCE(SUM(tt.SoTien), 0) AS ConLai
FROM HOADON hd
LEFT JOIN THANHTOAN tt
    ON hd.MaHD = tt.MaHD
GROUP BY
    hd.MaHD,
    hd.MaPK,
    hd.NgayLap,
    hd.TongTien,
    hd.TrangThai;
```
doanh thu dành cho thu ngân, admin
```sql
CREATE VIEW vw_DoanhThuPhieuKham
AS
SELECT
    pk.MaPK,
    pk.NgayKham,
    pk.PhiKham,

    COALESCE(dv.TienDichVu, 0) AS TienDichVu,
    COALESCE(t.TienThuoc, 0) AS TienThuoc,

    pk.PhiKham
        + COALESCE(dv.TienDichVu, 0)
        + COALESCE(t.TienThuoc, 0) AS TongTien
FROM PHIEUKHAM pk

LEFT JOIN (
    SELECT
        MaPK,
        SUM(SoLuong * DonGia) AS TienDichVu
    FROM CT_DICHVU
    GROUP BY MaPK
) dv
    ON pk.MaPK = dv.MaPK

LEFT JOIN (
    SELECT
        dt.MaPK,
        SUM(ct.SoLuong * ct.DonGia) AS TienThuoc
    FROM DONTHUOC dt
    JOIN CT_DONTHUOC ct
        ON dt.MaDon = ct.MaDon
    GROUP BY dt.MaPK
) t
    ON pk.MaPK = t.MaPK;
```
##### Stored Procedure
xem doanh thu trong một khoảng thời gian trên view đã tạo ở trên
```sql
CREATE OR ALTER PROCEDURE sp_ThongKeDoanhThu
    @TuNgay DATE,
    @DenNgay DATE
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        SUM(PhiKham) AS TongPhiKham,
        SUM(TienDichVu) AS TongTienDichVu,
        SUM(TienThuoc) AS TongTienThuoc,
        SUM(TongTien) AS TongDoanhThu
    FROM vw_DoanhThuPhieuKham
    WHERE NgayKham BETWEEN @TuNgay AND @DenNgay;
END;
```
thông kê thuốc sử dụng
```sql
CREATE OR ALTER PROCEDURE sp_ThongKeThuocSuDung
    @TuNgay DATE,
    @DenNgay DATE
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        t.MaThuoc,
        t.TenThuoc,
        SUM(ct.SoLuong) AS TongSoLuong,
        COUNT(DISTINCT dt.MaDon) AS SoDonThuoc
    FROM THUOC t
    JOIN CT_DONTHUOC ct
        ON t.MaThuoc = ct.MaThuoc
    JOIN DONTHUOC dt
        ON ct.MaDon = dt.MaDon
    WHERE dt.NgayKe BETWEEN @TuNgay AND @DenNgay
    GROUP BY
        t.MaThuoc,
        t.TenThuoc
    ORDER BY TongSoLuong DESC;
END;
```
thống kê dịch vụ sử dụng
```sql
CREATE OR ALTER PROCEDURE sp_ThongKeDichVuSuDung
    @TuNgay DATE,
    @DenNgay DATE
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        dv.MaDV,
        dv.TenDV,
        SUM(ct.SoLuong) AS TongSoLuong,
        SUM(ct.SoLuong * ct.DonGia) AS TongTien
    FROM DICHVU dv
    JOIN CT_DICHVU ct
        ON dv.MaDV = ct.MaDV
    JOIN PHIEUKHAM pk
        ON ct.MaPK = pk.MaPK
    WHERE pk.NgayKham BETWEEN @TuNgay AND @DenNgay
    GROUP BY
        dv.MaDV,
        dv.TenDV
    ORDER BY TongSoLuong DESC;
END;
```
thống kê lịch khám mỗi bác sĩ
```sql
CREATE OR ALTER PROCEDURE sp_ThongKeLuotKhamTheoBacSi
    @TuNgay DATE,
    @DenNgay DATE
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        bs.MaBS,
        bs.HoTen,
        COUNT(pk.MaPK) AS SoLuotKham
    FROM BACSI bs
    LEFT JOIN LICHKHAM lk
        ON bs.MaBS = lk.MaBS
    LEFT JOIN PHIEUKHAM pk
        ON lk.MaLich = pk.MaLich
        AND pk.NgayKham BETWEEN @TuNgay AND @DenNgay
    GROUP BY
        bs.MaBS,
        bs.HoTen
    ORDER BY SoLuotKham DESC;
END;
```
thống kê lượt khám theo chuyên khoa
```sql
CREATE OR ALTER PROCEDURE sp_ThongKeLuotKhamTheoChuyenKhoa
    @TuNgay DATE,
    @DenNgay DATE
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        ck.MaCK,
        ck.TenCK,
        COUNT(pk.MaPK) AS SoLuotKham
    FROM CHUYENKHOA ck
    JOIN BACSI bs
        ON ck.MaCK = bs.MaCK
    JOIN LICHKHAM lk
        ON bs.MaBS = lk.MaBS
    JOIN PHIEUKHAM pk
        ON lk.MaLich = pk.MaLich
    WHERE pk.NgayKham BETWEEN @TuNgay AND @DenNgay
    GROUP BY
        ck.MaCK,
        ck.TenCK
    ORDER BY SoLuotKham DESC;
END;
```
thống kê hóa đơn chưa thanh toán
```sql
CREATE OR ALTER PROCEDURE sp_LayHoaDonChuaThanhToan
AS
BEGIN
    SET NOCOUNT ON;

    SELECT *
    FROM vw_TinhTrangHoaDon
    WHERE ConLai > 0
    ORDER BY NgayLap;
END;
```
##### Indexes 

##### Transaction 
thực hiện trên chức năng:
- tạo lịch khám (xử lí đồng bộ khi có cả hai ngừoi cùng thực hiện đặt lịch)
- tạo thanh toán (diễn ra cùng với việc update trạng thái thành đã thanh toán)
- tạo đơn thuốc (sẽ diễn ra cùng lúc với tạo chi tiết đơn thuốc) => nếu thuốc hết hoặc gặp vấn đề giữa quá trình đó thì rollback 
- tạo phiếu khám (sau khi đã khám xong thì phải diễn ra đồng thời update cái trạng thái thành đã khám)
- thay đổi đơn thuốc (thêm thuốc vô đơn phải diễn ra cùng lúc với việc trừ thuốc trong kho)


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

