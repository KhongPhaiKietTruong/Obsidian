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

MaBN: Mã bệnh nhân, khóa chính.
HoTen: Họ và tên bệnh nhân.
NgaySinh: Ngày sinh.
GioiTinh: Giới tính.
SoDienThoai: Số điện thoại.
DiaChi: Địa chỉ.

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

