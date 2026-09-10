-- Create Database
CREATE DATABASE SieuThiMini;
GO
USE SieuThiMini;
GO

-- 1. CHUCVU
CREATE TABLE CHUCVU (
    maChucVu VARCHAR(36) PRIMARY KEY,
    tenChucVu NVARCHAR(50) NOT NULL
);

-- 2. NHANVIEN
CREATE TABLE NHANVIEN (
    maNhanVien VARCHAR(36) PRIMARY KEY,
    maChucVu VARCHAR(36) NOT NULL,
    hoTen NVARCHAR(100) NOT NULL,
    tenDangNhap VARCHAR(50) NOT NULL UNIQUE,
    matKhau VARCHAR(255) NOT NULL,
    soDienThoai VARCHAR(15) NULL UNIQUE,
    CONSTRAINT FK_NhanVien_ChucVu FOREIGN KEY (maChucVu) REFERENCES CHUCVU(maChucVu)
);

-- 3. HANGKHACHHANG
CREATE TABLE HANGKHACHHANG (
    maHangKhachHang VARCHAR(36) PRIMARY KEY,
    tenHangKhachHang NVARCHAR(50) NOT NULL
);

-- 4. KHACHHANG
CREATE TABLE KHACHHANG (
    maKhachHang VARCHAR(36) PRIMARY KEY,
    ngayTao DATETIME DEFAULT GETDATE() NOT NULL,
    hangKhachHang NVARCHAR(50) DEFAULT N'BAC',
    maHangKhachHang VARCHAR(36) NOT NULL,
    hoTen NVARCHAR(100) NOT NULL,
    soDienThoai VARCHAR(15) NULL UNIQUE,
    email VARCHAR(150) NULL,
    CONSTRAINT FK_KhachHang_HangKhachHang FOREIGN KEY (maHangKhachHang) REFERENCES HANGKHACHHANG(maHangKhachHang)
);

-- 5. LOAISANPHAM
CREATE TABLE LOAISANPHAM (
    maLoaiSanPham VARCHAR(36) PRIMARY KEY,
    tenLoaiSanPham NVARCHAR(100) NOT NULL,
    moTaLoaiSanPham NVARCHAR(MAX) NULL
);

-- 6. SANPHAM
CREATE TABLE SANPHAM (
    maSanPham VARCHAR(36) PRIMARY KEY,
    maLoaiSanPham VARCHAR(36) NOT NULL,
    tenSanPham NVARCHAR(100) NOT NULL,
    moTaSanPham NVARCHAR(MAX) NULL,
    trangThaiSanPham NVARCHAR(50) DEFAULT N'DANG_BAN',
    soLuongTon INT NOT NULL DEFAULT 0,
    ngayHetHan DATETIME NULL,
    nhaXuatXuat NVARCHAR(255) NULL,
    CONSTRAINT FK_SanPham_LoaiSanPham FOREIGN KEY (maLoaiSanPham) REFERENCES LOAISANPHAM(maLoaiSanPham)
);

-- 7. LOAITHANHTOAN
CREATE TABLE LOAITHANHTOAN (
    maLoaiThanhToan VARCHAR(36) PRIMARY KEY,
    tenLoaiThanhToan NVARCHAR(50) NOT NULL
);

-- 8. HOADON
CREATE TABLE HOADON (
    maHoaDon VARCHAR(36) PRIMARY KEY,
    maKhachHang VARCHAR(36) NOT NULL,
    maNhanVien VARCHAR(36) NOT NULL,
    ngayTao DATETIME NOT NULL DEFAULT GETDATE(),
    trangThai NVARCHAR(50) NOT NULL,
    tongTien DECIMAL(12,2) NOT NULL DEFAULT 0,
    coTienGiam DECIMAL(12,2) DEFAULT 0,
    ghiChu NVARCHAR(MAX) NULL,
    CONSTRAINT FK_HoaDon_KhachHang FOREIGN KEY (maKhachHang) REFERENCES KHACHHANG(maKhachHang),
    CONSTRAINT FK_HoaDon_NhanVien FOREIGN KEY (maNhanVien) REFERENCES NHANVIEN(maNhanVien)
);

-- 9. CHITIETHOADON
CREATE TABLE CHITIETHOADON (
    maChiTietHoaDon VARCHAR(36) PRIMARY KEY,
    maHoaDon VARCHAR(36) NOT NULL,
    maSanPham VARCHAR(36) NOT NULL,
    soLuong INT NOT NULL CHECK (soLuong > 0),
    donGia DECIMAL(12,2) NOT NULL,
    thanhTien DECIMAL(12,2) NOT NULL,
    CONSTRAINT FK_CTHD_HoaDon FOREIGN KEY (maHoaDon) REFERENCES HOADON(maHoaDon) ON DELETE CASCADE,
    CONSTRAINT FK_CTHD_SanPham FOREIGN KEY (maSanPham) REFERENCES SANPHAM(maSanPham)
);

-- 10. THANHTOAN
CREATE TABLE THANHTOAN (
    maGiaoDich VARCHAR(36) PRIMARY KEY,
    maHoaDon VARCHAR(36) NOT NULL,
    maLoaiThanhToan VARCHAR(36) NOT NULL,
    thoiGian DATETIME DEFAULT GETDATE(),
    trangThai NVARCHAR(50) DEFAULT N'CHUA_THANH_TOAN',
    soTien DECIMAL(12,2) NOT NULL CHECK (soTien >= 0),
    CONSTRAINT FK_ThanhToan_HoaDon FOREIGN KEY (maHoaDon) REFERENCES HOADON(maHoaDon),
    CONSTRAINT FK_ThanhToan_LoaiThanhToan FOREIGN KEY (maLoaiThanhToan) REFERENCES LOAITHANHTOAN(maLoaiThanhToan)
);

-- 11. PHIEUTRAHANG
CREATE TABLE PHIEUTRAHANG (
    maPhieuTraHang VARCHAR(36) PRIMARY KEY,
    maNhanVien VARCHAR(36) NOT NULL,
    maHoaDonGoc VARCHAR(36) NOT NULL,
    ngayTao DATETIME DEFAULT GETDATE() NOT NULL,
    trangThai NVARCHAR(50) NOT NULL,
    lyDoTra NVARCHAR(MAX) NULL,
    tongTienTra DECIMAL(12,2) NOT NULL DEFAULT 0,
    CONSTRAINT FK_PhieuTra_NhanVien FOREIGN KEY (maNhanVien) REFERENCES NHANVIEN(maNhanVien),
    CONSTRAINT FK_PhieuTra_HoaDon FOREIGN KEY (maHoaDonGoc) REFERENCES HOADON(maHoaDon)
);

-- 12. HOANTIEN
CREATE TABLE HOANTIEN (
    maGiaoDichHoan VARCHAR(36) PRIMARY KEY,
    maYeuCauTra VARCHAR(36) NOT NULL,
    trangThai NVARCHAR(50) NOT NULL,
    thoiGian DATETIME DEFAULT GETDATE(),
    loaiHoanTien NVARCHAR(50) DEFAULT N'TIENMAT',
    soTienHoan DECIMAL(12,2) NOT NULL CHECK (soTienHoan >= 0),
    CONSTRAINT FK_HoanTien_PhieuTra FOREIGN KEY (maYeuCauTra) REFERENCES PHIEUTRAHANG(maPhieuTraHang)
);

-- 13. DANHGIA
CREATE TABLE DANHGIA (
    maDanhGia VARCHAR(36) PRIMARY KEY,
    maKhachHang VARCHAR(36) NOT NULL,
    ngayDanhGia DATETIME DEFAULT GETDATE() NOT NULL,
    soSao INT NOT NULL CHECK (soSao >= 1 AND soSao <= 5),
    noiDung NVARCHAR(MAX) NULL,
    CONSTRAINT FK_DanhGia_KhachHang FOREIGN KEY (maKhachHang) REFERENCES KHACHHANG(maKhachHang)
);

-- 14. PHIEU (Bang co so - Table Per Hierarchy/Type Inheritance)
CREATE TABLE PHIEU (
    maPhieu VARCHAR(36) PRIMARY KEY,
    maNhanVien VARCHAR(36) NOT NULL,
    ngayTao DATETIME DEFAULT GETDATE() NOT NULL,
    tongTien DECIMAL(12,2) NOT NULL DEFAULT 0,
    CONSTRAINT FK_Phieu_NhanVien FOREIGN KEY (maNhanVien) REFERENCES NHANVIEN(maNhanVien)
);

-- 15. PHIEUNHAP (Ke thua PHIEU)
CREATE TABLE PHIEUNHAP (
    maPhieu VARCHAR(36) PRIMARY KEY,
    ghiChu NVARCHAR(MAX) NULL,
    nhaCungCap NVARCHAR(255) NULL,
    CONSTRAINT FK_PhieuNhap_Phieu FOREIGN KEY (maPhieu) REFERENCES PHIEU(maPhieu) ON DELETE CASCADE
);

-- 16. PHIEUHUY (Ke thua PHIEU)
CREATE TABLE PHIEUHUY (
    maPhieu VARCHAR(36) PRIMARY KEY,
    lyDoHuy NVARCHAR(MAX) NULL,
    CONSTRAINT FK_PhieuHuy_Phieu FOREIGN KEY (maPhieu) REFERENCES PHIEU(maPhieu) ON DELETE CASCADE
);

-- 17. CHITIETPHIEUNHAP
CREATE TABLE CHITIETPHIEUNHAP (
    maChiTietPhieuNhap VARCHAR(36) PRIMARY KEY,
    maPhieu VARCHAR(36) NOT NULL,
    maSanPham VARCHAR(36) NOT NULL,
    soLuongNhap INT NOT NULL CHECK (soLuongNhap > 0),
    donGia DECIMAL(12,2) NOT NULL,
    thanhTien DECIMAL(12,2) NOT NULL,
    giaNhap DECIMAL(12,2) NOT NULL CHECK (giaNhap >= 0),
    tenSoLuong DATETIME NULL,
    CONSTRAINT FK_CTPN_PhieuNhap FOREIGN KEY (maPhieu) REFERENCES PHIEUNHAP(maPhieu) ON DELETE CASCADE,
    CONSTRAINT FK_CTPN_SanPham FOREIGN KEY (maSanPham) REFERENCES SANPHAM(maSanPham)
);

-- 18. CHITIETPHIEUHUY
CREATE TABLE CHITIETPHIEUHUY (
    maChiTietPhieuHuy VARCHAR(36) PRIMARY KEY,
    maPhieu VARCHAR(36) NOT NULL,
    maSanPham VARCHAR(36) NOT NULL,
    soLuongHuy INT NOT NULL CHECK (soLuongHuy > 0),
    donGia DECIMAL(12,2) NOT NULL,
    lyDoHuy NVARCHAR(MAX) NULL,
    CONSTRAINT FK_CTPH_PhieuHuy FOREIGN KEY (maPhieu) REFERENCES PHIEUHUY(maPhieu) ON DELETE CASCADE,
    CONSTRAINT FK_CTPH_SanPham FOREIGN KEY (maSanPham) REFERENCES SANPHAM(maSanPham)
);

-- 19. BAOCAOKHO
CREATE TABLE BAOCAOKHO (
    maBaoCao VARCHAR(36) PRIMARY KEY,
    maNhanVien VARCHAR(36) NOT NULL,
    ngayLapBaoCao DATETIME DEFAULT GETDATE() NOT NULL,
    trangThai NVARCHAR(50) DEFAULT N'CHUAIN',
    hoTen NVARCHAR(100) NOT NULL,
    soDienThoai VARCHAR(15) NULL UNIQUE,
    email VARCHAR(150) NULL,
    CONSTRAINT FK_BaoCaoKho_NhanVien FOREIGN KEY (maNhanVien) REFERENCES NHANVIEN(maNhanVien)
);

-- 20. CHITIETBAOCAOKHO
CREATE TABLE CHITIETBAOCAOKHO (
    maBaoCao VARCHAR(36) NOT NULL,
    maSanPham VARCHAR(36) NOT NULL,
    soLuongTon INT NOT NULL CHECK (soLuongTon >= 0),
    giaSanPham DECIMAL(12,2) NOT NULL CHECK (giaSanPham >= 0),
    PRIMARY KEY (maBaoCao, maSanPham),
    CONSTRAINT FK_CTBCK_BaoCao FOREIGN KEY (maBaoCao) REFERENCES BAOCAOKHO(maBaoCao),
    CONSTRAINT FK_CTBCK_SanPham FOREIGN KEY (maSanPham) REFERENCES SANPHAM(maSanPham)
);

-- 1. Tìm thông tin khách hàng hiện tại qua số điện thoại
CREATE INDEX idx_khachhang_sdt 
ON KHACHHANG(soDienThoai);

-- 2. Tìm hóa đơn của khách hàng theo mã khách hàng (hỗ trợ truy vấn tìm hóa đơn từ SDT khách)
CREATE INDEX idx_hoadon_makh 
ON HOADON(maKhachHang);

-- 3. Liệt kê hóa đơn trong một ngày
CREATE INDEX idx_hoadon_ngayTao 
ON HOADON(ngayTao);

-- 4. Xem đánh giá khách hàng theo ngày
CREATE INDEX idx_danhgia_ngaydanhgia 
ON DANHGIA(ngayDanhGia);

-- 5. Kiểm tra số lượng bán ra của một sản phẩm cụ thể bằng mã sản phẩm
CREATE INDEX idx_chitiethoadon_masanpham 
ON CHITIETHOADON(maSanPham);

-- 6. Lấy chi tiết danh sách món trong một hóa đơn
CREATE INDEX idx_chitiethoadon_mahd 
ON CHITIETHOADON(maHoaDon);

-- 7. Lọc sản phẩm theo danh mục hàng (mã loại sản phẩm)
CREATE INDEX idx_sanpham_maloaisanpham 
ON SANPHAM(maLoaiSanPham);

-- 8. Tìm kiếm sản phẩm theo tên sản phẩm
CREATE INDEX idx_sanpham_tensanpham 
ON SANPHAM(tenSanPham);

-- 9. Lọc danh sách hóa đơn theo trạng thái
CREATE INDEX idx_hoadon_trangthai 
ON HOADON(trangThai);

-- 10. Liệt kê phiếu trả hàng theo ngày
CREATE INDEX idx_phieutrahang_ngaytao 
ON PHIEUTRAHANG(ngayTao);
GO