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

BENHNHAN 
MaBN (PK)
HoTen
NgaySinh
GioiTinh
SoDienThoai
DiaChi

BACSI
MaBS (PK)
MaCK (FK)

CHUYENKHOA
MaCK (PK)
TenCK
MoTa

**(MoTa vi phạm 3NF ?)**

LICHKHAM
MaLich (PK)
MaBN (FK)
MaBS (FK)
ThoiGianHenKham 
LyDoKham
TrangThai

PHIEUKHAM
MaPK (PK)
MaLich (FK)
ThoiGianKham
TrieuChung
ChanDoan
PhiKham

DONTHUOC 
MaDon (PK)
MaPK (FK)
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
SoLuong 

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
MaPK (FK)
ThoiGianLap
TongTien
TrangThai

THANHTOAN 
MaTT (PK)
MaHD (FK)
TGThanhToan
SoTien
PhuongThuc

