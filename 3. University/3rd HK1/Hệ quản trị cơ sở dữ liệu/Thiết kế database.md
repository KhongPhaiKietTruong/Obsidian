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
MaCK (FK) (BACSI.MaCK -> CHUYENKHOA.MaCK) (not null)

BENHNHAN 
MaBN (PK) 
HoTen (Not null)
NgaySinh
GioiTinh
SoDienThoai (Not null)
DiaChi

CHUYENKHOA
MaCK (PK)
TenCK (Unique, not null)
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
MaPK (Unique)(FK) (DONTHUOC.MaPK -> PHIEUKHAM.MaPK)
NgayKe (not null)
GhiChu

CT_DONTHUOC
(MaDon, MaThuoc) (PK)
SoLuong (>0) (not null)
LieuDung (nửa viên, 2 viên, ... )
HuongDan (Trước ngủ 30 phút)
DonGia: giá tại thời điểm bán (not null)

THUOC 
MaThuoc (PK)
TenThuoc (not null)
DonViTinh (Viên, Vỉ, Hộp) (not null)
Gia ( >0 ) (not null)
SoLuongConLai ( >= 0) not null

DICHVU
MaDV (PK)
TenDV (Not Null, Unique) 
Gia ( >0 ) not null
MoTa
TrangThai (Default 'Đang hoạt động') (Đang hoạt động, ngừng hoạt động, tạm dừng) not null

CT_DICHVU
(MaPK, MaDV) (PK)
DonGia (>0) not null
TrangThai (Chờ thực hiện, đã hoàn thành, đã hủy) not null
KetQua ('Natri cao', 'Ti le giun san cao', ...) NULL 
GhiChu

HOADON 
MaHD (PK)
MaPK (Unique )(FK) (HOADON.MaPK -> PHIEUKHAM.MaPK) 
ThoiGianLap (not null)
TongTien (>0) not null
TrangThai (defualt 'chờ thanh toán') (Đã thanh toán, Chờ thanh toán, Thanh toán một phần, Đã hủy) (not null) (Không được đổi trangthai của hoadon thành đã hủy nếu như nó đã được thanh toán một phần)

THANHTOAN 
MaTT (PK)
MaHD (FK) (THANHTOAN.MaHD -> HOADON.MaHD) (not null)
MaNVThu (THANHTOAN.MaNVThu -> NHANVIEN.MaNV) (not null)
ThoiGianThanhToan (not null)
SoTien (THANHTOAN.SoTien>0 And THANHTOAN.SoTien+(các khoản đã trả một phần)<=TongTien) (not null)
PhuongThuc ('Chuyen Khoan', 'Tien mat') not null


Stored Procedure để tính tổng tiền 

