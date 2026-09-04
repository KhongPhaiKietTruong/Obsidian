Hệ thống quản lí bệnh viện

NHANVIEN 
MaNV (PK) 
HoTen
NgaySinh
GioiTinh
SDT
DiaChi
ChucVu
TrangThai

BACSI
MaBS (PK) (FK) (BACSI.MaBS -> NHANVIEN.MaNV)
MaCK (FK) (BACSI.MaCK -> CHUYENKHOA.MaCK)

BENHNHAN 
MaBN (PK) 
HoTen
NgaySinh
GioiTinh
SoDienThoai
DiaChi

CHUYENKHOA
MaCK (PK)
TenCK
MoTa

LICHKHAM
MaLich (PK)
MaBN (FK) (LICHKHAM.MaBN -> BENHNHAN.MaBN)
MaBS (FK) (LICHKHAM.MaBS -> BACSI.MaBS)
ThoiGianHenKham 
LyDoKham
TrangThai

PHIEUKHAM
MaPK (PK)
MaLich (Unique) (FK) (PHIEUKHAM.MaLich -> LICHKHAM.MaLich) 
ThoiGianKham
TrieuChung
ChanDoan
PhiKham

DONTHUOC 
MaDon (PK)
MaPK (FK) (DONTHUOC.MaPK -> PHIEUKHAM.MaPK)
NgayKe
GhiChu

CT_DONTHUOC
(MaDon, MaThuoc) (PK)
SoLuong: Số lượng thuốc.
LieuDung: Liều dùng.
SoLanDung: Số lần sử dụng.
HuongDan: Hướng dẫn sử dụng.
DonGia: giá tại thời điểm bán

THUOC 
MaThuoc (PK)
TenThuoc
DonViTinh
DonGia
SoLuongConLai

DICHVU
MaDV (PK)
TenDV
DonGia
MoTa
TrangThai

CT_DICHVU
(MaPK, MaDV) (PK)
SoLuong: Số lượng dịch vụ.
DonGia: Đơn giá tại thời điểm sử dụng.
KetQua: Kết quả thực hiện dịch vụ.
GhiChu: Ghi chú.

HOADON 
MaHD (PK)
MaPK (FK) (HOADON.MaPK -> PHIEUKHAM.MaPK)
ThoiGianLap
TongTien
TrangThai

THANHTOAN 
MaTT (PK)
MaHD (FK) (THANHTOAN.MaHD -> HOADON.MaHD)
TGThanhToan
SoTien
PhuongThuc


Stored Procedure để tính tổng tiền 

