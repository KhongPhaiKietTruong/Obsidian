Hệ thống quản lí bệnh viện

NHANVIEN 
MaNV (PK) 
HoTen (Not null)
NgaySinh
GioiTinh
SDT (unique)
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
SoDienThoai (Not null, Unique)
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
TrangThai (Đang hoạt động, ngừng hoạt động, tạm dừng)

CT_DICHVU
(MaPK, MaDV) (PK)
DonGia: Đơn giá tại thời điểm sử dụng.
KetQua: Kết quả thực hiện dịch vụ.
GhiChu: Ghi chú.

HOADON 
MaHD (PK)
MaPK (FK) (HOADON.MaPK -> PHIEUKHAM.MaPK)
ThoiGianLap 
TongTien
TrangThai (Đã thanh toán, Chưa thanh toán, Thanh toán một phần)

THANHTOAN 
MaTT (PK)
MaHD (FK) (THANHTOAN.MaHD -> HOADON.MaHD)
TGThanhToan
SoTien
PhuongThuc


Stored Procedure để tính tổng tiền 

