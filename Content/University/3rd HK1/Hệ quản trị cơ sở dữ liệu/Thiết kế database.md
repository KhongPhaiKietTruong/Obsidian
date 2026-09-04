Hệ thống quản lí bệnh viện

NHANVIEN 
MaNV (PK) 
HoTen (Not null)
NgaySinh
GioiTinh
SDT (Not null)
DiaChi
ChucVu (Bác sĩ, thu ngân, y tá, lễ tân)
TrangThai (Còn làm, đã nghỉ)

BACSI
MaBS (PK) (FK) (BACSI.MaBS -> NHANVIEN.MaNV)
MaCK (FK) (BACSI.MaCK -> CHUYENKHOA.MaCK)

BENHNHAN 
MaBN (PK) 
HoTen (Not null)
NgaySinh
GioiTinh
SoDienThoai (Not null)
DiaChi

CHUYENKHOA
MaCK (PK)
TenCK (Unique)
MoTa

LICHKHAM
MaLich (PK)
MaBN (FK) (LICHKHAM.MaBN -> BENHNHAN.MaBN)
MaBS (FK) (LICHKHAM.MaBS -> BACSI.MaBS)
ThoiGianHenKham (Not null)
TrangThai (default 'Chờ khám') (Chờ khám, đã khám, vắng mặt, đã hủy)

PHIEUKHAM
MaPK (PK)
MaLich (Unique) (FK) (PHIEUKHAM.MaLich -> LICHKHAM.MaLich) 
ThoiGianKham (Not null)
TrieuChung
ChanDoan
PhiKham ( >=0 )

DONTHUOC 
MaDon (PK)
MaPK (FK) (DONTHUOC.MaPK -> PHIEUKHAM.MaPK)
NgayKe
GhiChu

CT_DONTHUOC
(MaDon, MaThuoc) (PK)
SoLuong (>0)
LieuDung (nửa viên, 2 liền, ... )
HuongDan (Trước ngủ 30 phút)
DonGia: giá tại thời điểm bán

THUOC 
MaThuoc (PK)
TenThuoc
DonViTinh (Viên, Vỉ, Hộp)
Gia ( >0 )
SoLuongConLai ( >= 0)

DICHVU
MaDV (PK)
TenDV (Not Null, Unique) 
Gia ( >0 )
MoTa
TrangThai (Default 'Đang hoạt động') (Đang hoạt động, ngừng hoạt động, tạm dừng)

CT_DICHVU
(MaPK, MaDV) (PK)
DonGia (>0)
TrangThai (Chờ thực hiện, đã hoàn thành, đã hủy)
KetQua ('Natri cao', 'Ti le giun san cao', ...) NULL 
GhiChu

HOADON 
MaHD (PK)
MaPK (Unique )(FK) (HOADON.MaPK -> PHIEUKHAM.MaPK) 
ThoiGianLap (not null)
TongTien (>0) 
TrangThai (defualt 'chờ thanh toán') (Đã thanh toán, Chờ thanh toán, Thanh toán một phần, Đã hủy)

THANHTOAN 
MaTT (PK)
MaHD (FK) (THANHTOAN.MaHD -> HOADON.MaHD)
MaNVThu (THANHTOAN.NguoiThu -> NHANVIEN.MaNV)
ThoiGianThanhToan 
SoTien (>0 And <=TongTien)
PhuongThuc ('Chuyen Khoan', 'Tien mat')


Stored Procedure để tính tổng tiền 

