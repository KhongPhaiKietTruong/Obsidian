Hệ thống quản lí bệnh viện

NHANVIEN 
MaNV (PK) 
HoTen
NgaySinh
GioiTinh
SDT
DiaChi
ChucVu (Bác sĩ, thu ngân, y tá, lễ tân)
TrangThai (Còn làm việc, đã nghỉ)

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
TrangThai (Đã khám, vắng mặt, đã hủy)

PHIEUKHAM
MaPK (PK)
MaLich (Unique) (FK) (PHIEUKHAM.MaLich -> LICHKHAM.MaLich) 
ThoiGianKham
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
LieuDung: Liều dùng.
SoLanDung: Số lần sử dụng.
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
TrangThai ()

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

