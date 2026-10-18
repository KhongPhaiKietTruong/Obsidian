USE QuanLyPhongKhamDB;
GO

-- ====================================================================================================
-- DỰ ÁN HỆ THỐNG QUẢN LÝ PHÒNG KHÁM ĐA KHOA (QuanLyPhongKhamDB)
-- FILE: massive_seed_data.sql
-- MỤC ĐÍCH: Nạp số lượng lớn dữ liệu mẫu thực tế, đầy đủ quy trình từ Khám, Chẩn đoán, 
--           Cận lâm sàng, Kê đơn, Kho dược cho đến Hóa đơn viện phí và Phân tích doanh thu.
-- TÁC VỤ: 
--   1. 30 Người dùng hệ thống (Admin, Bác sĩ 15 chuyên khoa, Lễ tân, Dược sĩ) - Pass: 123456
--   2. 15 Bác sĩ chuyên khoa tại các phòng khám riêng biệt
--   3. 120+ Bệnh nhân thực tế với đầy đủ CCCD, SĐT, Ngày sinh, Địa chỉ khắp các tỉnh thành
--   4. 85 Loại thuốc, dược phẩm, vắc-xin, vật tư y tế (đa dạng tồn kho, hạn dùng, cảnh báo cận hạn)
--   5. 35 Dịch vụ khám, cận lâm sàng, siêu âm, xét nghiệm, chẩn đoán hình ảnh
--   6. 160+ Lịch hẹn khám (bao gồm hàng chờ hôm nay, lịch sắp tới, và lịch sử đã khám/đã hủy)
--   7. 120+ Hồ sơ bệnh án chi tiết (triệu chứng, chẩn đoán bệnh học, lời dặn bác sĩ)
--   8. 200+ Chỉ định dịch vụ cận lâm sàng có kết quả trả về
--   9. 280+ Đơn thuốc kê chi tiết (liều lượng, cách dùng theo chuẩn dược lý)
--  10. 120+ Hóa đơn viện phí chuẩn xác về tổng tiền, thực thu, giảm giá và phương thức thanh toán
-- ====================================================================================================

SET NOCOUNT ON;
PRINT N'==> Đang chuẩn bị môi trường nạp dữ liệu lớn...';

-- Tạm thời vô hiệu hóa ràng buộc & trigger để nạp dữ liệu lịch sử số lượng lớn với tốc độ cao
ALTER TABLE hoa_don NOCHECK CONSTRAINT ALL;
ALTER TABLE don_thuoc NOCHECK CONSTRAINT ALL;
ALTER TABLE chi_dinh_dich_vu NOCHECK CONSTRAINT ALL;
ALTER TABLE ho_so_kham NOCHECK CONSTRAINT ALL;
ALTER TABLE lich_hen NOCHECK CONSTRAINT ALL;
ALTER TABLE thuoc NOCHECK CONSTRAINT ALL;
ALTER TABLE dich_vu NOCHECK CONSTRAINT ALL;
ALTER TABLE bac_si NOCHECK CONSTRAINT ALL;
ALTER TABLE benh_nhan NOCHECK CONSTRAINT ALL;
ALTER TABLE nguoi_dung NOCHECK CONSTRAINT ALL;

IF OBJECT_ID('dbo.trg_ke_don_tru_kho', 'TR') IS NOT NULL DISABLE TRIGGER dbo.trg_ke_don_tru_kho ON don_thuoc;
IF OBJECT_ID('dbo.trg_kiem_tra_han_thuoc', 'TR') IS NOT NULL DISABLE TRIGGER dbo.trg_kiem_tra_han_thuoc ON don_thuoc;
IF OBJECT_ID('dbo.trg_xoa_don_hoan_kho', 'TR') IS NOT NULL DISABLE TRIGGER dbo.trg_xoa_don_hoan_kho ON don_thuoc;
IF OBJECT_ID('dbo.trg_hoan_thanh_lich_kham', 'TR') IS NOT NULL DISABLE TRIGGER dbo.trg_hoan_thanh_lich_kham ON ho_so_kham;

PRINT N'==> Xóa sạch dữ liệu thử nghiệm cũ theo đúng quan hệ khóa ngoại...';
DELETE FROM hoa_don;
DELETE FROM don_thuoc;
DELETE FROM chi_dinh_dich_vu;
DELETE FROM ho_so_kham;
DELETE FROM lich_hen;
DELETE FROM thuoc;
DELETE FROM dich_vu;
DELETE FROM bac_si;
DELETE FROM benh_nhan;
DELETE FROM nguoi_dung;
GO

-- ====================================================================================================
-- 1. BẢNG NGUOI_DUNG (30 Nhân sự - Mật khẩu mặc định: '123456' đã băm bằng BCrypt)
-- Hash: $2a$10$CbWVqBZFDDI0hQXkqpPzhukEsnnzoWZJdjoE6ozNIAKNZNKcCT5oW
-- ====================================================================================================
PRINT N'==> 1. Đang nạp danh sách Người dùng (Quản trị viên, Bác sĩ, Lễ tân, Dược sĩ)...';

INSERT INTO nguoi_dung (ma_nguoi_dung, ten_dang_nhap, mat_khau_hash, ho_ten, so_dien_thoai, vai_tro, hoat_dong, ngay_tao) VALUES
-- Quản trị viên
('ND001', 'admin',     '$2a$10$CbWVqBZFDDI0hQXkqpPzhukEsnnzoWZJdjoE6ozNIAKNZNKcCT5oW', N'ThS. Nguyễn Văn Quản Trị',   '0901000001', 'QUAN_TRI', 1, '2025-01-01'),
('ND002', 'admin2',    '$2a$10$CbWVqBZFDDI0hQXkqpPzhukEsnnzoWZJdjoE6ozNIAKNZNKcCT5oW', N'KS. Hoàng Minh Giám Đốc',    '0901000002', 'QUAN_TRI', 1, '2025-01-01'),

-- 15 Bác sĩ chuyên khoa (bacsi1 -> bacsi15)
('ND003', 'bacsi1',   '$2a$10$CbWVqBZFDDI0hQXkqpPzhukEsnnzoWZJdjoE6ozNIAKNZNKcCT5oW', N'BS.CKII Nguyễn Văn An',      '0902000001', 'BAC_SI', 1, '2025-01-02'),
('ND004', 'bacsi2',   '$2a$10$CbWVqBZFDDI0hQXkqpPzhukEsnnzoWZJdjoE6ozNIAKNZNKcCT5oW', N'ThS.BS Trần Thị Bích',       '0902000002', 'BAC_SI', 1, '2025-01-02'),
('ND005', 'bacsi3',   '$2a$10$CbWVqBZFDDI0hQXkqpPzhukEsnnzoWZJdjoE6ozNIAKNZNKcCT5oW', N'BS.CKI Lê Hoàng Cường',       '0902000003', 'BAC_SI', 1, '2025-01-02'),
('ND006', 'bacsi4',   '$2a$10$CbWVqBZFDDI0hQXkqpPzhukEsnnzoWZJdjoE6ozNIAKNZNKcCT5oW', N'TS.BS Phạm Quốc Dũng',        '0902000004', 'BAC_SI', 1, '2025-01-03'),
('ND007', 'bacsi5',   '$2a$10$CbWVqBZFDDI0hQXkqpPzhukEsnnzoWZJdjoE6ozNIAKNZNKcCT5oW', N'BS.CKI Vũ Thị Hồng Hạnh',    '0902000005', 'BAC_SI', 1, '2025-01-03'),
('ND008', 'bacsi6',   '$2a$10$CbWVqBZFDDI0hQXkqpPzhukEsnnzoWZJdjoE6ozNIAKNZNKcCT5oW', N'BS.CKII Đặng Đình Khang',    '0902000006', 'BAC_SI', 1, '2025-01-04'),
('ND009', 'bacsi7',   '$2a$10$CbWVqBZFDDI0hQXkqpPzhukEsnnzoWZJdjoE6ozNIAKNZNKcCT5oW', N'ThS.BS Bùi Mai Linh',        '0902000007', 'BAC_SI', 1, '2025-01-04'),
('ND010', 'bacsi8',   '$2a$10$CbWVqBZFDDI0hQXkqpPzhukEsnnzoWZJdjoE6ozNIAKNZNKcCT5oW', N'BS. Đỗ Tuấn Minh',          '0902000008', 'BAC_SI', 1, '2025-01-05'),
('ND011', 'bacsi9',   '$2a$10$CbWVqBZFDDI0hQXkqpPzhukEsnnzoWZJdjoE6ozNIAKNZNKcCT5oW', N'BS.CKI Hồ Trọng Nghĩa',      '0902000009', 'BAC_SI', 1, '2025-01-05'),
('ND012', 'bacsi10',  '$2a$10$CbWVqBZFDDI0hQXkqpPzhukEsnnzoWZJdjoE6ozNIAKNZNKcCT5oW', N'TS.BS Ngô Thanh Phong',      '0902000010', 'BAC_SI', 1, '2025-01-06'),
('ND013', 'bacsi11',  '$2a$10$CbWVqBZFDDI0hQXkqpPzhukEsnnzoWZJdjoE6ozNIAKNZNKcCT5oW', N'BS.CKII Dương Ngọc Quang',   '0902000011', 'BAC_SI', 1, '2025-01-06'),
('ND014', 'bacsi12',  '$2a$10$CbWVqBZFDDI0hQXkqpPzhukEsnnzoWZJdjoE6ozNIAKNZNKcCT5oW', N'BS. Lý Cẩm Tú',             '0902000012', 'BAC_SI', 1, '2025-01-07'),
('ND015', 'bacsi13',  '$2a$10$CbWVqBZFDDI0hQXkqpPzhukEsnnzoWZJdjoE6ozNIAKNZNKcCT5oW', N'ThS.BS Trịnh Văn Sơn',       '0902000013', 'BAC_SI', 1, '2025-01-07'),
('ND016', 'bacsi14',  '$2a$10$CbWVqBZFDDI0hQXkqpPzhukEsnnzoWZJdjoE6ozNIAKNZNKcCT5oW', N'BS.CKI Phan Thị Thảo',       '0902000014', 'BAC_SI', 1, '2025-01-08'),
('ND017', 'bacsi15',  '$2a$10$CbWVqBZFDDI0hQXkqpPzhukEsnnzoWZJdjoE6ozNIAKNZNKcCT5oW', N'BS. Đoàn Minh Uy',          '0902000015', 'BAC_SI', 1, '2025-01-08'),

-- 6 Lễ tân & Thu ngân (letan1 -> letan6)
('ND018', 'letan1',   '$2a$10$CbWVqBZFDDI0hQXkqpPzhukEsnnzoWZJdjoE6ozNIAKNZNKcCT5oW', N'Lê Thị Thu Cúc',            '0903000001', 'LE_TAN', 1, '2025-01-01'),
('ND019', 'letan2',   '$2a$10$CbWVqBZFDDI0hQXkqpPzhukEsnnzoWZJdjoE6ozNIAKNZNKcCT5oW', N'Trần Thị Kim Loan',         '0903000002', 'LE_TAN', 1, '2025-01-02'),
('ND020', 'letan3',   '$2a$10$CbWVqBZFDDI0hQXkqpPzhukEsnnzoWZJdjoE6ozNIAKNZNKcCT5oW', N'Nguyễn Hoàng Ngọc Diệp',    '0903000003', 'LE_TAN', 1, '2025-01-02'),
('ND021', 'letan4',   '$2a$10$CbWVqBZFDDI0hQXkqpPzhukEsnnzoWZJdjoE6ozNIAKNZNKcCT5oW', N'Phạm Thùy Trang',           '0903000004', 'LE_TAN', 1, '2025-01-03'),
('ND022', 'letan5',   '$2a$10$CbWVqBZFDDI0hQXkqpPzhukEsnnzoWZJdjoE6ozNIAKNZNKcCT5oW', N'Võ Mỹ Duyên',               '0903000005', 'LE_TAN', 1, '2025-01-04'),
('ND023', 'letan6',   '$2a$10$CbWVqBZFDDI0hQXkqpPzhukEsnnzoWZJdjoE6ozNIAKNZNKcCT5oW', N'Đinh Gia Hân',              '0903000006', 'LE_TAN', 1, '2025-01-05'),

-- 7 Dược sĩ quản lý kho (duocsi1 -> duocsi7)
('ND024', 'duocsi1',  '$2a$10$CbWVqBZFDDI0hQXkqpPzhukEsnnzoWZJdjoE6ozNIAKNZNKcCT5oW', N'DS. Trần Văn Dược',         '0904000001', 'DUOC_SI', 1, '2025-01-01'),
('ND025', 'duocsi2',  '$2a$10$CbWVqBZFDDI0hQXkqpPzhukEsnnzoWZJdjoE6ozNIAKNZNKcCT5oW', N'DS. Nguyễn Thùy Chi',       '0904000002', 'DUOC_SI', 1, '2025-01-02'),
('ND026', 'duocsi3',  '$2a$10$CbWVqBZFDDI0hQXkqpPzhukEsnnzoWZJdjoE6ozNIAKNZNKcCT5oW', N'DS. Vũ Đình Hùng',          '0904000003', 'DUOC_SI', 1, '2025-01-03'),
('ND027', 'duocsi4',  '$2a$10$CbWVqBZFDDI0hQXkqpPzhukEsnnzoWZJdjoE6ozNIAKNZNKcCT5oW', N'DS. Đỗ Thị Phương Thảo',    '0904000004', 'DUOC_SI', 1, '2025-01-04'),
('ND028', 'duocsi5',  '$2a$10$CbWVqBZFDDI0hQXkqpPzhukEsnnzoWZJdjoE6ozNIAKNZNKcCT5oW', N'DS. Hoàng Nhật Tân',        '0904000005', 'DUOC_SI', 1, '2025-01-05'),
('ND029', 'duocsi6',  '$2a$10$CbWVqBZFDDI0hQXkqpPzhukEsnnzoWZJdjoE6ozNIAKNZNKcCT5oW', N'DS. Bùi Thu Hà',            '0904000006', 'DUOC_SI', 1, '2025-01-06'),
('ND030', 'duocsi7',  '$2a$10$CbWVqBZFDDI0hQXkqpPzhukEsnnzoWZJdjoE6ozNIAKNZNKcCT5oW', N'DS. Lương Vĩnh Khang',      '0904000007', 'DUOC_SI', 1, '2025-01-07');
GO

-- ====================================================================================================
-- 2. BẢNG BAC_SI (15 Bác sĩ chuyên khoa, khóa ngoại liên kết ND003 -> ND017)
-- ====================================================================================================
PRINT N'==> 2. Đang nạp danh sách Bác sĩ chuyên khoa...';

INSERT INTO bac_si (ma_bac_si, chuyen_khoa, so_chung_chi, phong_kham) VALUES
('BS001', N'Nội tổng quát',            'CCHN-001/HCM-2015', 'P.101'),
('BS002', N'Tim mạch can thiệp',        'CCHN-002/HCM-2016', 'P.102'),
('BS003', N'Tai Mũi Họng',             'CCHN-003/HCM-2017', 'P.103'),
('BS004', N'Nhi khoa tổng hợp',        'CCHN-004/HCM-2015', 'P.104'),
('BS005', N'Da liễu & Thẩm mỹ y khoa', 'CCHN-005/HCM-2018', 'P.105'),
('BS006', N'Cơ Xương Khớp - Cột sống',  'CCHN-006/HCM-2016', 'P.201'),
('BS007', N'Tiêu hóa & Gan mật',       'CCHN-007/HCM-2017', 'P.202'),
('BS008', N'Răng Hàm Mặt',             'CCHN-008/HCM-2019', 'P.203'),
('BS009', N'Mắt (Nhãn khoa)',          'CCHN-009/HCM-2018', 'P.204'),
('BS010', N'Thần kinh - Giấc ngủ',      'CCHN-010/HCM-2015', 'P.205'),
('BS011', N'Hô hấp - Phổi',            'CCHN-011/HCM-2016', 'P.301'),
('BS012', N'Nội tiết & Tiểu đường',     'CCHN-012/HCM-2017', 'P.302'),
('BS013', N'Sản phụ khoa',             'CCHN-013/HCM-2018', 'P.303'),
('BS014', N'Dinh dưỡng lâm sàng',      'CCHN-014/HCM-2020', 'P.304'),
('BS015', N'Y học cổ truyền & VLTL',   'CCHN-015/HCM-2019', 'P.305');
GO

-- ====================================================================================================
-- 3. BẢNG BENH_NHAN (120 Bệnh nhân đầy đủ hồ sơ thực tế)
-- ====================================================================================================
PRINT N'==> 3. Đang nạp danh sách 120 Bệnh nhân...';

INSERT INTO benh_nhan (ma_benh_nhan, ho_ten, ngay_sinh, gioi_tinh, so_dien_thoai, so_cccd, dia_chi, ngay_tao) VALUES
('BN001', N'Nguyễn Thị Lan',        '1995-05-15', N'Nữ',  '0988111222', '079195000001', N'123 Lê Lợi, P. Bến Nghé, Q.1, TP.HCM',             '2025-01-10'),
('BN002', N'Trần Văn Nam',          '1988-10-20', N'Nam', '0977333444', '079188000002', N'456 Nguyễn Huệ, P. Bến Nghé, Q.1, TP.HCM',           '2025-01-11'),
('BN003', N'Lê Thị Hương',          '1976-03-08', N'Nữ',  '0966555666', '079176000003', N'78 Hai Bà Trưng, P. Tân Định, Q.1, TP.HCM',        '2025-01-12'),
('BN004', N'Phạm Đức Thắng',        '1982-12-14', N'Nam', '0912345678', '079182000004', N'12 Điện Biên Phủ, P. Đa Kao, Q.1, TP.HCM',         '2025-01-13'),
('BN005', N'Vũ Hoàng Anh',          '2001-07-22', N'Nam', '0934567890', '079201000005', N'34 Nguyễn Thị Minh Khai, P.6, Q.3, TP.HCM',        '2025-01-14'),
('BN006', N'Đặng Thu Thảo',         '1993-09-05', N'Nữ',  '0945678901', '079193000006', N'56 Võ Văn Tần, P. Võ Thị Sáu, Q.3, TP.HCM',        '2025-01-15'),
('BN007', N'Bùi Minh Trí',          '1965-04-18', N'Nam', '0923456789', '079165000007', N'89 Cách Mạng Tháng 8, P.10, Q.3, TP.HCM',        '2025-01-16'),
('BN008', N'Đỗ Cẩm Ly',            '2010-11-30', N'Nữ',  '0987654321', '079210000008', N'101 Nam Kỳ Khởi Nghĩa, P.7, Q.3, TP.HCM',         '2025-01-17'),
('BN009', N'Hồ Bảo Long',           '1990-01-25', N'Nam', '0978901234', '079190000009', N'222 Hoàng Diệu, P.9, Q.4, TP.HCM',                 '2025-01-18'),
('BN010', N'Ngô Quỳnh Như',         '1985-08-12', N'Nữ',  '0967890123', '079185000010', N'15 Bến Vân Đồn, P.12, Q.4, TP.HCM',                '2025-01-19'),
('BN011', N'Dương Tuấn Kiệt',       '1972-06-03', N'Nam', '0956789012', '079172000011', N'45 Đoàn Văn Bơ, P.14, Q.4, TP.HCM',               '2025-01-20'),
('BN012', N'Lý Mỹ Duyên',           '1998-02-14', N'Nữ',  '0938112233', '079198000012', N'300 Trần Hưng Đạo, P.11, Q.5, TP.HCM',             '2025-01-21'),
('BN013', N'Trịnh Quốc Bảo',        '1980-10-09', N'Nam', '0919223344', '079180000013', N'120 Nguyễn Trãi, P.3, Q.5, TP.HCM',                 '2025-01-22'),
('BN014', N'Phan Thanh Hà',         '1992-05-27', N'Nữ',  '0908334455', '079192000014', N'88 Châu Văn Liêm, P.14, Q.5, TP.HCM',              '2025-01-23'),
('BN015', N'Đoàn Gia Huy',          '2005-12-01', N'Nam', '0989445566', '079205000015', N'25 Hậu Giang, P.2, Q.6, TP.HCM',                   '2025-01-24'),
('BN016', N'Mai Ánh Tuyết',         '1968-07-19', N'Nữ',  '0976556677', '079168000016', N'70 Bình Phú, P.11, Q.6, TP.HCM',                  '2025-01-25'),
('BN017', N'Vương Quốc Cường',      '1979-09-11', N'Nam', '0965667788', '079179000017', N'180 Nguyễn Văn Luông, P.12, Q.6, TP.HCM',           '2025-01-26'),
('BN018', N'Tạ Thùy Trang',         '1994-04-04', N'Nữ',  '0944778899', '079194000018', N'450 Huỳnh Tấn Phát, P. Tân Thuận Đông, Q.7, TP.HCM', '2025-01-27'),
('BN019', N'Lâm Hữu Nghĩa',         '1987-03-31', N'Nam', '0933889900', '079187000019', N'77 Nguyễn Thị Thập, P. Tân Quy, Q.7, TP.HCM',       '2025-01-28'),
('BN020', N'Cao Bích Ngọc',         '1999-08-20', N'Nữ',  '0922990011', '079199000020', N'105 Lê Văn Lương, P. Tân Kiểng, Q.7, TP.HCM',      '2025-01-29'),
('BN021', N'Huỳnh Tấn Tài',         '1962-11-15', N'Nam', '0911001122', '079162000021', N'50 Phạm Hùng, P.4, Q.8, TP.HCM',                    '2025-01-30'),
('BN022', N'La Mộng Điệp',          '1983-01-08', N'Nữ',  '0981112233', '079183000022', N'120 Tùng Thiện Vương, P.13, Q.8, TP.HCM',          '2025-01-31'),
('BN023', N'Chu Đình Trọng',        '1991-06-25', N'Nam', '0972223344', '079191000023', N'90 Hưng Phú, P.8, Q.8, TP.HCM',                    '2025-02-01'),
('BN024', N'Thạch Thị Sô Phia',     '1996-10-14', N'Nữ',  '0963334455', '079196000024', N'35 Ba Đình, P.10, Q.8, TP.HCM',                   '2025-02-02'),
('BN025', N'Lương Hoàng Phúc',      '1975-02-28', N'Nam', '0945445566', '079175000025', N'500 Lê Hồng Phong, P.1, Q.10, TP.HCM',             '2025-02-03'),
('BN026', N'Nghiêm Tú Uyên',        '1997-12-05', N'Nữ',  '0936556677', '079197000026', N'18 Ba Tháng Hai, P.12, Q.10, TP.HCM',              '2025-02-04'),
('BN027', N'Tô Vĩnh Lộc',           '1984-07-07', N'Nam', '0927667788', '079184000027', N'75 Sư Vạn Hạnh, P.12, Q.10, TP.HCM',                '2025-02-05'),
('BN028', N'Văn Diệu Huyền',        '2003-09-17', N'Nữ',  '0918778899', '079203000028', N'130 Lý Thường Kiệt, P.7, Q.10, TP.HCM',            '2025-02-06'),
('BN029', N'Quách Khắc Cường',      '1969-05-19', N'Nam', '0909889900', '079169000029', N'60 Hòa Bình, P.5, Q.11, TP.HCM',                   '2025-02-07'),
('BN030', N'Bạch Kiều Oanh',        '1990-11-11', N'Nữ',  '0988990011', '079190000030', N'250 Lạc Long Quân, P.3, Q.11, TP.HCM',             '2025-02-08'),
('BN031', N'Diệp Minh Thuận',       '1978-04-23', N'Nam', '0977001122', '079178000031', N'45 Ông Ích Khiêm, P.10, Q.11, TP.HCM',              '2025-02-09'),
('BN032', N'Ân Ngọc Bích',          '1993-08-30', N'Nữ',  '0966112233', '079193000032', N'88 Bình Thới, P.14, Q.11, TP.HCM',                 '2025-02-10'),
('BN033', N'Sơn Tùng Lâm',          '1986-03-12', N'Nam', '0955223344', '079186000033', N'120 Nguyễn Văn Quá, P. Đông Hưng Thuận, Q.12, TP.HCM', '2025-02-11'),
('BN034', N'Liêu Cẩm Hằng',         '1995-01-02', N'Nữ',  '0934334455', '079195000034', N'45 Lê Văn Khương, P. Hiệp Thành, Q.12, TP.HCM',    '2025-02-12'),
('BN035', N'Thái Bá Hùng',          '1981-10-18', N'Nam', '0923445566', '079181000035', N'78 Tô Ký, P. Trung Mỹ Tây, Q.12, TP.HCM',          '2025-02-13'),
('BN036', N'Khưu Kim Yến',          '2000-06-20', N'Nữ',  '0912556677', '079200000036', N'210 Hà Huy Giáp, P. Thạnh Lộc, Q.12, TP.HCM',      '2025-02-14'),
('BN037', N'Tăng Hữu Phước',        '1964-12-08', N'Nam', '0901667788', '079164000037', N'15 Phan Đăng Lưu, P.3, Q. Bình Thạnh, TP.HCM',     '2025-02-15'),
('BN038', N'Trác Ngọc Mai',         '1992-07-29', N'Nữ',  '0982778899', '079192000038', N'90 Bạch Đằng, P.24, Q. Bình Thạnh, TP.HCM',        '2025-02-16'),
('BN039', N'Võ Đình Khôi',          '1989-02-17', N'Nam', '0973889900', '079189000039', N'300 Xô Viết Nghệ Tĩnh, P.21, Q. Bình Thạnh, TP.HCM', '2025-02-17'),
('BN040', N'Kim Thị Thanh Thảo',    '1977-09-04', N'Nữ',  '0964990011', '079177000040', N'145 Nơ Trang Long, P.12, Q. Bình Thạnh, TP.HCM',   '2025-02-18'),
('BN041', N'Phùng Vĩnh Thụy',       '1994-11-22', N'Nam', '0945001122', '079194000041', N'12 Quang Trung, P.10, Q. Gò Vấp, TP.HCM',          '2025-02-19'),
('BN042', N'Triệu Mẫn Nhi',         '2002-03-15', N'Nữ',  '0936112233', '079202000042', N'88 Phan Văn Trị, P.7, Q. Gò Vấp, TP.HCM',          '2025-02-20'),
('BN043', N'Kha Văn Lượng',         '1973-08-09', N'Nam', '0927223344', '079173000043', N'40 Lê Đức Thọ, P.16, Q. Gò Vấp, TP.HCM',           '2025-02-21'),
('BN044', N'Thái Thúy An',          '1988-05-14', N'Nữ',  '0918334455', '079188000044', N'150 Nguyễn Oanh, P.17, Q. Gò Vấp, TP.HCM',         '2025-02-22'),
('BN045', N'Biện Công Thành',       '1991-01-30', N'Nam', '0909445566', '079191000045', N'220 Thống Nhất, P.11, Q. Gò Vấp, TP.HCM',          '2025-02-23'),
('BN046', N'Nhan Quế Anh',          '1967-10-26', N'Nữ',  '0980556677', '079167000046', N'75 Hoàng Văn Thụ, P.8, Q. Phú Nhuận, TP.HCM',      '2025-02-24'),
('BN047', N'Tôn Thất Hiệp',         '1985-04-12', N'Nam', '0971667788', '079185000047', N'110 Phan Xích Long, P.2, Q. Phú Nhuận, TP.HCM',    '2025-02-25'),
('BN048', N'Lê Đặng Bảo Trâm',      '1998-12-19', N'Nữ',  '0962778899', '079198000048', N'55 Phan Đăng Lưu, P.1, Q. Phú Nhuận, TP.HCM',     '2025-02-26'),
('BN049', N'Dư Quốc Đạt',           '1983-06-07', N'Nam', '0953889900', '079183000049', N'18 Nguyễn Văn Trỗi, P.15, Q. Phú Nhuận, TP.HCM',   '2025-02-27'),
('BN050', N'Tăng Mỹ Linh',          '2004-02-24', N'Nữ',  '0944990011', '079204000050', N'34 Thích Quảng Đức, P.5, Q. Phú Nhuận, TP.HCM',   '2025-02-28'),
('BN051', N'Trần Đại Nghĩa',        '1970-07-16', N'Nam', '0935001122', '079170000051', N'200 Cộng Hòa, P.12, Q. Tân Bình, TP.HCM',          '2025-03-01'),
('BN052', N'Nguyễn Hoàng Yến',      '1993-03-10', N'Nữ',  '0926112233', '079193000052', N'15 Trường Chinh, P.14, Q. Tân Bình, TP.HCM',       '2025-03-02'),
('BN053', N'Phạm Tiến Dũng',        '1986-11-28', N'Nam', '0917223344', '079186000053', N'80 Hoàng Hoa Thám, P.13, Q. Tân Bình, TP.HCM',     '2025-03-03'),
('BN054', N'Vũ Khánh Linh',         '2001-08-05', N'Nữ',  '0908334455', '079201000054', N'95 Phổ Quang, P.2, Q. Tân Bình, TP.HCM',          '2025-03-04'),
('BN055', N'Hoàng Trọng Tấn',       '1974-05-18', N'Nam', '0989445566', '079174000055', N'45 Lê Văn Sỹ, P.1, Q. Tân Bình, TP.HCM',           '2025-03-05'),
('BN056', N'Đỗ Minh Châu',          '1996-09-23', N'Nữ',  '0970556677', '079196000056', N'112 Tân Kỳ Tân Quý, P.15, Q. Tân Bình, TP.HCM',   '2025-03-06'),
('BN057', N'Bùi Vĩnh Thụy',         '1982-01-14', N'Nam', '0961667788', '079182000057', N'60 Lũy Bán Bích, P. Tân Thới Hòa, Q. Tân Phú, TP.HCM', '2025-03-07'),
('BN058', N'Hồ Thảo Vy',            '1999-04-27', N'Nữ',  '0952778899', '079199000058', N'120 Thoại Ngọc Hầu, P. Phú Thạnh, Q. Tân Phú, TP.HCM', '2025-03-08'),
('BN059', N'Đặng Gia Kiệt',         '2006-10-11', N'Nam', '0943889900', '079206000059', N'45 Vườn Lài, P. Tân Thành, Q. Tân Phú, TP.HCM',    '2025-03-09'),
('BN060', N'Lý Bích Thủy',          '1966-06-30', N'Nữ',  '0934990011', '079166000060', N'88 Tân Hương, P. Tân Quý, Q. Tân Phú, TP.HCM',     '2025-03-10'),
-- Thêm từ BN061 -> BN120 với đa dạng lứa tuổi và các tỉnh lân cận
('BN061', N'Ngô Tấn Đạt',           '1990-03-15', N'Nam', '0983114477', '079190000061', N'34 Bình Long, P. Sơn Kỳ, Q. Tân Phú, TP.HCM',      '2025-03-11'),
('BN062', N'Trần Ngọc Ánh',         '1985-07-22', N'Nữ',  '0974225588', '079185000062', N'15 Tên Lửa, P. An Lạc A, Q. Bình Tân, TP.HCM',     '2025-03-12'),
('BN063', N'Lê Minh Quân',          '1979-11-09', N'Nam', '0965336699', '079179000063', N'90 Kinh Dương Vương, P. An Lạc, Q. Bình Tân, TP.HCM', '2025-03-13'),
('BN064', N'Phạm Thúy Hằng',        '1997-02-18', N'Nữ',  '0946447700', '079197000064', N'210 Mã Lò, P. Bình Trị Đông A, Q. Bình Tân, TP.HCM', '2025-03-14'),
('BN065', N'Vũ Đình Trọng',         '1984-08-04', N'Nam', '0937558811', '079184000065', N'55 Liên Khu 5-6, P. Bình Hưng Hòa, Q. Bình Tân, TP.HCM', '2025-03-15'),
('BN066', N'Đặng Thanh Nhàn',       '1963-05-12', N'Nữ',  '0928669922', '079163000066', N'180 Lê Văn Quới, P. Bình Hưng Hòa A, Q. Bình Tân, TP.HCM', '2025-03-16'),
('BN067', N'Bùi Hữu Tài',           '1992-12-25', N'Nam', '0919770033', '079192000067', N'25 Đường Số 7, P. Bình Trị Đông B, Q. Bình Tân, TP.HCM', '2025-03-17'),
('BN068', N'Đỗ Cẩm Vân',            '2003-04-03', N'Nữ',  '0901881144', '079203000068', N'77 Gò Xoài, P. Bình Hưng Hòa A, Q. Bình Tân, TP.HCM', '2025-03-18'),
('BN069', N'Hồ Quốc Khánh',         '1976-09-19', N'Nam', '0982992255', '079176000069', N'120 Võ Văn Kiệt, P. Cầu Ông Lãnh, Q.1, TP.HCM',    '2025-03-19'),
('BN070', N'Ngô Mai Phương',        '1995-06-08', N'Nữ',  '0973003366', '079195000070', N'45 Cô Bắc, P. Cô Giang, Q.1, TP.HCM',              '2025-03-20'),
('BN071', N'Dương Văn Mười',        '1958-01-01', N'Nam', '0964114477', '079158000071', N'12 Nguyễn Bỉnh Khiêm, P. Bến Nghé, Q.1, TP.HCM',   '2025-03-21'),
('BN072', N'Lý Thúy Kiều',          '1991-10-15', N'Nữ',  '0955225588', '079191000072', N'88 Tôn Đức Thắng, P. Bến Nghé, Q.1, TP.HCM',        '2025-03-22'),
('BN073', N'Trịnh Bá Thông',        '1987-03-29', N'Nam', '0946336699', '079187000073', N'100 Pasteur, P. Bến Nghé, Q.1, TP.HCM',             '2025-03-23'),
('BN074', N'Phan Ngọc Diệp',        '2000-11-14', N'Nữ',  '0937447700', '079200000074', N'67 Lê Thị Riêng, P. Bến Thành, Q.1, TP.HCM',        '2025-03-24'),
('BN075', N'Đoàn Văn Vĩnh',         '1971-08-20', N'Nam', '0928558811', '079171000075', N'23 Yersin, P. Cầu Ông Lãnh, Q.1, TP.HCM',           '2025-03-25'),
('BN076', N'Mai Tuyết Nga',         '1983-04-16', N'Nữ',  '0919669922', '079183000076', N'15 Trần Đình Xu, P. Cầu Kho, Q.1, TP.HCM',          '2025-03-26'),
('BN077', N'Vương Đình Khang',      '1994-09-02', N'Nam', '0901770033', '079194000077', N'50 Ký Con, P. Nguyễn Thái Bình, Q.1, TP.HCM',        '2025-03-27'),
('BN078', N'Tạ Kiều Nga',           '1969-12-28', N'Nữ',  '0982881144', '079169000078', N'34 Calmette, P. Nguyễn Thái Bình, Q.1, TP.HCM',    '2025-03-28'),
('BN079', N'Lâm Tuấn Tú',           '1998-05-09', N'Nam', '0973992255', '079198000079', N'89 Phó Đức Chính, P. Nguyễn Thái Bình, Q.1, TP.HCM', '2025-03-29'),
('BN080', N'Cao Mỹ Nhân',           '1986-07-21', N'Nữ',  '0964003366', '079186000080', N'12 Chu Mạnh Trinh, P. Bến Nghé, Q.1, TP.HCM',       '2025-03-30'),
('BN081', N'Huỳnh Gia Bảo',         '2005-01-17', N'Nam', '0955114477', '079205000081', N'45 Trương Định, P. Bến Thành, Q.1, TP.HCM',        '2025-04-01'),
('BN082', N'La Cẩm Nhung',          '1993-10-31', N'Nữ',  '0946225588', '079193000082', N'90 Thủ Khoa Huân, P. Bến Thành, Q.1, TP.HCM',       '2025-04-02'),
('BN083', N'Chu Văn An',            '1975-06-11', N'Nam', '0937336699', '079175000083', N'120 Lý Tự Trọng, P. Bến Thành, Q.1, TP.HCM',        '2025-04-03'),
('BN084', N'Thạch Thị Hương',       '1989-03-05', N'Nữ',  '0928447700', '079189000084', N'55 Mạc Đĩnh Chi, P. Đa Kao, Q.1, TP.HCM',           '2025-04-04'),
('BN085', N'Lương Thế Vinh',        '1961-09-18', N'Nam', '0919558811', '079161000085', N'80 Đinh Tiên Hoàng, P. Đa Kao, Q.1, TP.HCM',        '2025-04-05'),
('BN086', N'Nghiêm Mỹ Hạnh',        '1996-12-03', N'Nữ',  '0901669922', '079196000086', N'15 Nguyễn Thành Ý, P. Đa Kao, Q.1, TP.HCM',         '2025-04-06'),
('BN087', N'Tô Hoài Nam',           '1982-08-27', N'Nam', '0982770033', '079182000087', N'34 Mai Thị Lựu, P. Đa Kao, Q.1, TP.HCM',            '2025-04-07'),
('BN088', N'Văn Bích Hợp',          '1977-02-15', N'Nữ',  '0973881144', '079177000088', N'67 Nguyễn Văn Thủ, P. Đa Kao, Q.1, TP.HCM',         '2025-04-08'),
('BN089', N'Quách Phú Thành',       '1999-11-20', N'Nam', '0964992255', '079199000089', N'89 Nguyễn Đình Chiểu, P. Đa Kao, Q.1, TP.HCM',     '2025-04-09'),
('BN090', N'Bạch Tố Trinh',         '1990-04-14', N'Nữ',  '0955003366', '079190000090', N'12 Trần Cao Vân, P. Đa Kao, Q.1, TP.HCM',           '2025-04-10'),
('BN091', N'Diệp Lạc Thành',        '1984-07-08', N'Nam', '0946114477', '079184000091', N'45 Phùng Khắc Khoan, P. Đa Kao, Q.1, TP.HCM',       '2025-04-11'),
('BN092', N'Ân Thảo My',            '2002-09-29', N'Nữ',  '0937225588', '079202000092', N'88 Mạc Thị Bưởi, P. Bến Nghé, Q.1, TP.HCM',         '2025-04-12'),
('BN093', N'Sơn Tùng Bách',         '1973-12-05', N'Nam', '0928336699', '079173000093', N'15 Ngô Đức Kế, P. Bến Nghé, Q.1, TP.HCM',          '2025-04-13'),
('BN094', N'Liêu Mỹ Hoa',           '1988-06-22', N'Nữ',  '0919447700', '079188000094', N'34 Hồ Tùng Mậu, P. Bến Nghé, Q.1, TP.HCM',          '2025-04-14'),
('BN095', N'Thái Khắc Huy',         '1995-02-11', N'Nam', '0901558811', '079195000095', N'70 Huỳnh Thúc Kháng, P. Bến Nghé, Q.1, TP.HCM',     '2025-04-15'),
('BN096', N'Khưu Thùy Dung',        '1965-08-30', N'Nữ',  '0982669922', '079165000096', N'12 Tôn Thất Đạm, P. Bến Nghé, Q.1, TP.HCM',         '2025-04-16'),
('BN097', N'Tăng Minh Quân',        '1980-05-16', N'Nam', '0973770033', '079180000097', N'45 Hải Triều, P. Bến Nghé, Q.1, TP.HCM',            '2025-04-17'),
('BN098', N'Trác Thu Uyên',         '1997-01-24', N'Nữ',  '0964881144', '079197000098', N'89 Bùi Viện, P. Phạm Ngũ Lão, Q.1, TP.HCM',         '2025-04-18'),
('BN099', N'Võ Đại Dương',          '1986-10-07', N'Nam', '0955992255', '079186000099', N'15 Đỗ Quang Đẩu, P. Phạm Ngũ Lão, Q.1, TP.HCM',     '2025-04-19'),
('BN100', N'Kim Mỹ Duyên',          '2001-03-19', N'Nữ',  '0946003366', '079201000100', N'80 Cống Quỳnh, P. Phạm Ngũ Lão, Q.1, TP.HCM',        '2025-04-20'),
('BN101', N'Phùng Văn Đức',         '1972-11-26', N'Nam', '0937114477', '079172000101', N'12 Nguyễn Trãi, P. Bến Thành, Q.1, TP.HCM',         '2025-04-21'),
('BN102', N'Triệu Thị Lan',         '1994-08-14', N'Nữ',  '0928225588', '079194000102', N'45 Lê Lai, P. Bến Thành, Q.1, TP.HCM',             '2025-04-22'),
('BN103', N'Kha Minh Toàn',         '1981-04-09', N'Nam', '0919336699', '079181000103', N'90 Phạm Hồng Thái, P. Bến Thành, Q.1, TP.HCM',      '2025-04-23'),
('BN104', N'Thái Ngọc Anh',         '1998-12-02', N'Nữ',  '0901447700', '079198000104', N'15 Nguyễn Thị Nghĩa, P. Bến Thành, Q.1, TP.HCM',    '2025-04-24'),
('BN105', N'Biện Quốc Huy',         '1968-07-25', N'Nam', '0982558811', '079168000105', N'34 Trịnh Văn Cấn, P. Cầu Ông Lãnh, Q.1, TP.HCM',    '2025-04-25'),
('BN106', N'Nhan Thị Lệ',           '1985-02-17', N'Nữ',  '0973669922', '079185000106', N'78 Nguyễn Thái Học, P. Cầu Ông Lãnh, Q.1, TP.HCM',  '2025-04-26'),
('BN107', N'Tôn Thất Bách',         '1992-09-08', N'Nam', '0964770033', '079192000107', N'12 Cô Giang, P. Cầu Ông Lãnh, Q.1, TP.HCM',         '2025-04-27'),
('BN108', N'Lê Thị Thu Thủy',       '1979-03-31', N'Nữ',  '0955881144', '079179000108', N'45 Đề Thám, P. Cô Giang, Q.1, TP.HCM',             '2025-04-28'),
('BN109', N'Dư Văn Cường',          '2004-10-15', N'Nam', '0946992255', '079204000109', N'90 Nguyễn Khắc Nhu, P. Cô Giang, Q.1, TP.HCM',      '2025-04-29'),
('BN110', N'Tăng Thị Tuyết',        '1964-06-21', N'Nữ',  '0937003366', '079164000110', N'15 Hồ Hảo Hớn, P. Cô Giang, Q.1, TP.HCM',          '2025-04-30'),
('BN111', N'Trần Đình Trọng',       '1989-01-11', N'Nam', '0928114477', '079189000111', N'34 Trần Hưng Đạo, P. Cầu Kho, Q.1, TP.HCM',        '2025-05-01'),
('BN112', N'Nguyễn Thị Kim Chi',    '1996-08-04', N'Nữ',  '0919225588', '079196000112', N'78 Nguyễn Cảnh Chân, P. Cầu Kho, Q.1, TP.HCM',      '2025-05-02'),
('BN113', N'Phạm Gia Khiêm',        '1974-12-29', N'Nam', '0901336699', '079174000113', N'12 Nguyễn Văn Cừ, P. Cầu Kho, Q.1, TP.HCM',        '2025-05-03'),
('BN114', N'Vũ Hoàng Yến',          '2003-05-18', N'Nữ',  '0982447700', '079203000114', N'45 Bến Vân Đồn, P.9, Q.4, TP.HCM',                 '2025-05-04'),
('BN115', N'Hoàng Tuấn Anh',        '1983-09-09', N'Nam', '0973558811', '079183000115', N'90 Vĩnh Khánh, P.10, Q.4, TP.HCM',                  '2025-05-05'),
('BN116', N'Đỗ Thị Bích Ngân',      '1991-04-23', N'Nữ',  '0964669922', '079191000116', N'15 Tôn Thất Thuyết, P.16, Q.4, TP.HCM',            '2025-05-06'),
('BN117', N'Bùi Quang Dũng',        '1978-11-05', N'Nam', '0955770033', '079178000117', N'34 Xóm Chiếu, P.14, Q.4, TP.HCM',                  '2025-05-07'),
('BN118', N'Hồ Thị Cẩm Tú',         '1999-07-14', N'Nữ',  '0946881144', '079199000118', N'78 Nguyễn Thần Hiến, P.18, Q.4, TP.HCM',           '2025-05-08'),
('BN119', N'Đặng Minh Vương',       '1987-02-28', N'Nam', '0937992255', '079187000119', N'120 Trương Đình Hội, P.16, Q.8, TP.HCM',           '2025-05-09'),
('BN120', N'Lý Thị Mỹ Châu',        '1967-10-02', N'Nữ',  '0928003366', '079167000120', N'45 Mễ Cốc, P.15, Q.8, TP.HCM',                     '2025-05-10');
GO

-- ====================================================================================================
-- 4. BẢNG THUOC (85 Dược phẩm phong phú: Kháng sinh, Giảm đau, Tim mạch, Tiêu hóa, Cận hạn...)
-- ====================================================================================================
PRINT N'==> 4. Đang nạp danh mục 85 Dược phẩm & Vật tư y tế...';

INSERT INTO thuoc (ma_thuoc, ten_thuoc, don_vi_tinh, so_luong_ton, don_gia, han_su_dung, trang_thai) VALUES
-- Nhóm Giảm đau, Hạ sốt, Kháng viêm
('T001', N'Paracetamol 500mg (Panadol)',      N'Viên', 500,  2000, '2028-06-30', 1),
('T002', N'Efferalgan 500mg sủi',             N'Viên', 300,  4500, '2027-12-31', 1),
('T003', N'Hapacol 250mg trẻ em',             N'Gói',  250,  3000, '2027-10-20', 1),
('T004', N'Ibuprofen 400mg',                  N'Viên', 200,  3500, '2027-08-15', 1),
('T005', N'Celebrex 200mg (Celecoxib)',       N'Viên', 120, 18500, '2028-01-10', 1),
('T006', N'Meloxicam 7.5mg',                  N'Viên', 180,  4200, '2027-09-30', 1),
('T007', N'Alpha Choay (Chymotrypsine)',      N'Viên', 450,  3800, '2027-11-25', 1),
('T008', N'Medrol 16mg (Methylprednisolon)',  N'Viên', 100,  7500, '2027-07-15', 1),
('T009', N'Prednisolon 5mg',                  N'Viên', 350,  1500, '2028-03-20', 1),
('T010', N'Voltaren 50mg (Diclofenac)',       N'Viên',  80,  6000, '2027-05-30', 1),

-- Nhóm Kháng sinh & Kháng khuẩn
('T011', N'Amoxicillin 500mg',                N'Viên', 400,  3000, '2027-12-31', 1),
('T012', N'Augmentin 1g (Amox/Clav)',         N'Viên', 150, 22000, '2027-08-30', 1),
('T013', N'Cefuroxim 500mg (Zinnat)',         N'Viên', 200, 19500, '2027-10-15', 1),
('T014', N'Cefixim 200mg',                    N'Viên', 180,  9500, '2027-11-05', 1),
('T015', N'Azithromycin 500mg (Zithromax)',   N'Viên',  90, 28000, '2027-06-25', 1),
('T016', N'Clarithromycin 500mg (Klacid)',    N'Viên',  70, 24000, '2027-09-10', 1),
('T017', N'Ciprofloxacin 500mg',              N'Viên', 130,  5500, '2027-12-01', 1),
('T018', N'Levofloxacin 500mg (Tavanic)',     N'Viên',  85, 32000, '2028-02-15', 1),
('T019', N'Metronidazol 250mg (Klion)',       N'Viên', 220,  2000, '2027-07-20', 1),
('T020', N'Doxycyclin 100mg',                 N'Viên', 140,  2500, '2027-10-30', 1),

-- Nhóm Dạ dày - Tiêu hóa - Gan mật
('T021', N'Nexium 40mg (Esomeprazole)',       N'Viên', 160, 25500, '2028-05-20', 1),
('T022', N'Omeprazole 20mg',                  N'Viên', 300,  3000, '2027-11-15', 1),
('T023', N'Pantoprazole 40mg (Pantocid)',     N'Viên', 140, 12000, '2027-08-20', 1),
('T024', N'Gaviscon Dual Action (Gói)',       N'Gói',  280,  9500, '2027-09-25', 1),
('T025', N'Phosphalugel (Gel chữ P)',         N'Gói',  300,  6000, '2027-12-10', 1),
('T026', N'Motilium-M 10mg (Domperidone)',    N'Viên', 190,  4500, '2027-07-10', 1),
('T027', N'Smecta 3g (Diosmectite)',          N'Gói',  210,  5000, '2028-01-15', 1),
('T028', N'Men vi sinh Enterogermina 5ml',    N'Ống',  200, 12500, '2027-10-05', 1),
('T029', N'Berberin 100mg',                   N'Viên', 500,   800, '2028-04-30', 1),
('T030', N'Boganic Forte bổ gan',             N'Viên', 240,  3500, '2027-11-20', 1),

-- Nhóm Tim mạch - Huyết áp - Mỡ máu
('T031', N'Amlodipine 5mg (Amlor)',           N'Viên', 320,  6500, '2028-03-15', 1),
('T032', N'Coversyl 5mg (Perindopril)',       N'Viên', 150, 11500, '2027-08-10', 1),
('T033', N'Losartan 50mg (Cozaar)',           N'Viên', 180,  9000, '2027-12-05', 1),
('T034', N'Concor 2.5mg (Bisoprolol)',        N'Viên', 140,  7000, '2027-10-18', 1),
('T035', N'Betaloc ZOK 25mg (Metoprolol)',    N'Viên', 110,  8500, '2027-09-12', 1),
('T036', N'Lipitor 20mg (Atorvastatin)',      N'Viên', 130, 21000, '2028-02-28', 1),
('T037', N'Crestor 10mg (Rosuvastatin)',      N'Viên', 120, 23500, '2027-11-30', 1),
('T038', N'Plavix 75mg (Clopidogrel)',        N'Viên',  95, 26000, '2027-07-25', 1),
('T039', N'Aspirin pH8 500mg',                N'Viên', 250,  1500, '2027-10-10', 1),
('T040', N'Micardis Plus 80/12.5mg',          N'Viên',  80, 19500, '2027-06-30', 1),

-- Nhóm Hô hấp - Dị ứng - Tai mũi họng
('T041', N'Telfast HD 180mg (Fexofenadine)',  N'Viên', 160, 12500, '2027-09-15', 1),
('T042', N'Cetirizin 10mg',                   N'Viên', 400,  1800, '2028-01-20', 1),
('T043', N'Loratadin 10mg',                   N'Viên', 300,  2000, '2027-12-15', 1),
('T044', N'Singulair 10mg (Montelukast)',     N'Viên', 100, 22000, '2027-10-01', 1),
('T045', N'Siro Ho Prospan 100ml',            N'Chai',  85, 85000, '2027-08-20', 1),
('T046', N'Bisolvon 8mg (Bromhexin)',         N'Viên', 220,  2500, '2027-11-10', 1),
('T047', N'Xịt mũi Otrivin 0.1% 10ml',        N'Chai',  90, 56000, '2027-07-05', 1),
('T048', N'Xịt mũi Avamys 120 liều',          N'Chai',  50,245000, '2027-09-30', 1),
('T049', N'Viên ngậm Dorithricin',            N'Viên', 180,  5500, '2027-12-20', 1),
('T050', N'Viên ngậm Strepsils Cool',         N'Gói',  250,  7000, '2028-03-10', 1),

-- Nhóm Thần kinh - Tuần hoàn não - Giấc ngủ
('T051', N'Tanakan 40mg (Ginkgo Biloba)',     N'Viên', 170,  7500, '2027-10-25', 1),
('T052', N'Nootropil 800mg (Piracetam)',      N'Viên', 140,  6000, '2027-08-15', 1),
('T053', N'Stugeron 25mg (Cinnarizin)',       N'Viên', 280,  2200, '2027-11-05', 1),
('T054', N'Betaserc 16mg (Betahistine)',      N'Viên', 130,  8500, '2027-12-30', 1),
('T055', N'Mag B6 (Magnesi & Vitamin B6)',    N'Viên', 350,  2500, '2028-02-10', 1),
('T056', N'Rotunda 30mg định thần',           N'Viên', 200,  2000, '2027-09-20', 1),

-- Nhóm Tiểu đường - Nội tiết
('T057', N'Glucophage XR 500mg (Metformin)',  N'Viên', 260,  6000, '2028-01-05', 1),
('T058', N'Diamicron MR 60mg (Gliclazide)',   N'Viên', 150,  9500, '2027-08-18', 1),
('T059', N'Januvia 50mg (Sitagliptin)',       N'Viên',  80, 25000, '2027-10-12', 1),
('T060', N'Berlthyrox 100mcg (Levothyroxin)', N'Viên', 120,  3000, '2027-07-22', 1),

-- Nhóm Vitamin - Khoáng chất - Thuốc bổ
('T061', N'Vitamin C 500mg OPC',              N'Viên', 400,  1500, '2028-06-15', 1),
('T062', N'Vitamin 3B (B1-B6-B12)',           N'Viên', 450,  1200, '2028-05-10', 1),
('T063', N'Berocca Performance sủi',          N'Viên', 180, 11000, '2027-11-18', 1),
('T064', N'Canxi Corbiere 10ml',              N'Ống',  160, 13500, '2027-09-08', 1),
('T065', N'Ostelin Vitamin D3 1000IU',        N'Viên', 110,  5000, '2028-02-20', 1),
('T066', N'Dầu cá Omega-3 1000mg',            N'Viên', 190,  4000, '2028-04-12', 1),
('T067', N'Kẽm Farzincol 10mg',               N'Viên', 220,  2800, '2027-10-30', 1),
('T068', N'Sắt Fumafer B9 bổ máu',            N'Viên', 250,  2000, '2027-12-14', 1),

-- Nhóm Nhãn khoa - Da liễu ngoài da
('T069', N'Nhỏ mắt Tobradex 5ml (Tobra/Dex)', N'Lọ',   100, 68000, '2027-08-25', 1),
('T070', N'Nhỏ mắt Sanlein 0.1% 5ml',        N'Lọ',   120, 75000, '2027-10-15', 1),
('T071', N'Nhỏ mắt Systane Ultra 10ml',       N'Lọ',    80, 95000, '2027-09-05', 1),
('T072', N'Bôi Da Fucidin 2% 15g',            N'Tuýp',  95, 98000, '2027-11-10', 1),
('T073', N'Kem bôi Silkron 10g 7 màu',        N'Tuýp', 130, 32000, '2027-07-20', 1),
('T074', N'Kem bôi Klenzit-C trị mụn',        N'Tuýp',  70,140000, '2027-08-15', 1),
('T075', N'Gel bôi Voltaren Emulgel 20g',     N'Tuýp', 110, 85000, '2027-12-05', 1),

-- CÁC MẶT HÀNG ĐẶC BIỆT: TEST CẢNH BÁO TỒN KHO THẤP (< 20) & CẬN HẠN DÙNG (< 30 NGÀY)
('T076', N'Paracetamol Truyền 10mg/ml 100ml', N'Chai',  12, 45000, '2028-01-01', 1), -- Cảnh báo tồn thấp (< 20)
('T077', N'Kháng sinh Vancomycin 500mg tiêm', N'Lọ',     8,185000, '2027-12-31', 1), -- Cảnh báo tồn thấp (< 20)
('T078', N'Insulin Mixtard 30 Penfill 3ml',   N'Ống',    6,165000, '2027-11-20', 1), -- Cảnh báo tồn thấp (< 20)
('T079', N'Cồn y tế 70 độ 500ml',             N'Chai',  15, 18000, '2028-06-30', 1), -- Cảnh báo tồn thấp (< 20)
('T080', N'Nước muối sinh lý NaCl 0.9% 500ml',N'Chai',  18, 12000, '2028-08-15', 1), -- Cảnh báo tồn thấp (< 20)
('T081', N'Vắc-xin Cúm Mùa Vaxigrip Tetra',   N'Liều',  10,350000, DATEADD(DAY, 15, CAST(GETDATE() AS DATE)), 1), -- CẬN HẠN (< 30 ngày) & Tồn ít
('T082', N'Huyết thanh uốn ván SAT 1500IU',   N'Ống',    5, 95000, DATEADD(DAY, 10, CAST(GETDATE() AS DATE)), 1), -- CẬN HẠN (< 30 ngày) & Tồn ít
('T083', N'Thuốc ho trẻ em Astex 90ml',       N'Chai',  80, 48000, DATEADD(DAY, 20, CAST(GETDATE() AS DATE)), 1), -- CẬN HẠN (< 30 ngày)
('T084', N'Viên ngậm Tyrothricin sát khuẩn',  N'Hộp',   95, 65000, DATEADD(DAY, 25, CAST(GETDATE() AS DATE)), 1), -- CẬN HẠN (< 30 ngày)
('T085', N'Gel rửa tay khô sát khuẩn 100ml',  N'Chai', 110, 35000, DATEADD(DAY, 18, CAST(GETDATE() AS DATE)), 1); -- CẬN HẠN (< 30 ngày)
GO

-- ====================================================================================================
-- 5. BẢNG DICH_VU (35 Dịch vụ khám, siêu âm, xét nghiệm, chẩn đoán hình ảnh)
-- ====================================================================================================
PRINT N'==> 5. Đang nạp danh mục 35 Dịch vụ y tế...';

INSERT INTO dich_vu (ma_dich_vu, ten_dich_vu, don_gia, mo_ta, trang_thai) VALUES
-- Khám lâm sàng
('DV001', N'Khám bệnh Nội tổng quát',                  150000, N'Khám lâm sàng nội khoa tổng quát', 1),
('DV002', N'Khám chuyên khoa Tim mạch',                200000, N'Khám chuyên sâu bệnh lý tim mạch huyết áp', 1),
('DV003', N'Khám chuyên khoa Tai Mũi Họng',            180000, N'Khám và soi cơ bản vùng tai mũi họng', 1),
('DV004', N'Khám chuyên khoa Nhi',                     180000, N'Khám lâm sàng theo dõi sự phát triển trẻ em', 1),
('DV005', N'Khám chuyên khoa Da liễu',                 180000, N'Khám bệnh lý da liễu và soi da', 1),
('DV006', N'Khám chuyên khoa Cơ Xương Khớp',           200000, N'Khám bệnh lý cột sống, đau nhức khớp', 1),
('DV007', N'Khám chuyên khoa Tiêu hóa - Gan mật',      200000, N'Khám bệnh lý dạ dày ruột gan tụy', 1),
('DV008', N'Khám chuyên khoa Mắt',                     160000, N'Đo thị lực và khám khúc xạ mắt', 1),
('DV009', N'Khám Răng Hàm Mặt tổng quát',             150000, N'Kiểm tra răng miệng và nha chu', 1),
('DV010', N'Khám Sản phụ khoa',                        200000, N'Khám phụ khoa định kỳ cho phụ nữ', 1),

-- Xét nghiệm huyết học, sinh hóa, miễn dịch
('DV011', N'Xét nghiệm Tổng phân tích máu (24 thông số)',150000, N'Công thức máu toàn phần đo hồng cầu bạch cầu', 1),
('DV012', N'Xét nghiệm Đường huyết đói (Glucose)',        60000, N'Định lượng nồng độ glucose trong huyết tương', 1),
('DV013', N'Xét nghiệm HbA1c (Đường huyết 3 tháng)',     180000, N'Đánh giá hiệu quả kiểm soát đường huyết', 1),
('DV014', N'Xét nghiệm Chức năng gan (AST / ALT / GGT)', 160000, N'Đánh giá mức độ tổn thương tế bào gan', 1),
('DV015', N'Xét nghiệm Chức năng thận (Ure / Creatinine)',120000, N'Đánh giá mức lọc cầu thận', 1),
('DV016', N'Xét nghiệm Bộ mỡ máu (Lipid Profile toàn phần)',220000, N'Cholesterol, Triglycerid, HDL-C, LDL-C', 1),
('DV017', N'Xét nghiệm Axit Uric máu (Tầm soát Gout)',    80000, N'Chẩn đoán bệnh Gout và tăng axit uric máu', 1),
('DV018', N'Xét nghiệm Tổng phân tích nước tiểu (10 thông số)', 70000, N'Phát hiện nhiễm trùng đường tiểu, bệnh thận', 1),
('DV019', N'Test nhanh Kháng nguyên Viêm gan B (HBsAg)', 120000, N'Tầm soát nhiễm virus viêm gan B', 1),
('DV020', N'Test nhanh Viêm gan C (Anti-HCV)',           140000, N'Tầm soát kháng thể virus viêm gan C', 1),
('DV021', N'Test nhanh Vi khuẩn HP dạ dày (Test hơi thở C13)', 650000, N'Phát hiện vi khuẩn Helicobacter Pylori', 1),
('DV022', N'Test nhanh Cúm A/B và Covid-19',             150000, N'Xét nghiệm dịch tỵ hầu phát hiện virus cúm', 1),

-- Chẩn đoán hình ảnh & Thăm dò chức năng
('DV023', N'Chụp X-quang Tim phổi thẳng (KTS)',        180000, N'Chẩn đoán hình ảnh phổi và bóng tim kỹ thuật số', 1),
('DV024', N'Chụp X-quang Cột sống thắt lưng (2 tư thế)',220000, N'Phát hiện thoái hóa, thoát vị đĩa đệm', 1),
('DV025', N'Chụp X-quang Khớp gối (Thẳng + Nghiêng)',  200000, N'Đánh giá khe khớp và gai xương', 1),
('DV026', N'Siêu âm Bụng tổng quát màu 4D',            250000, N'Khảo sát gan mật tụy lách thận bàng quang', 1),
('DV027', N'Siêu âm Tim Doppler màu',                  450000, N'Đánh giá chức năng van tim và cơ tim', 1),
('DV028', N'Siêu âm Tuyến giáp Doppler màu',           200000, N'Tầm soát nhân xơ và nang tuyến giáp', 1),
('DV029', N'Siêu âm Tuyến vú 2 bên',                   220000, N'Tầm soát sớm u vú ở phụ nữ', 1),
('DV030', N'Đo Điện tim (ECG 12 chuyển đạo)',           100000, N'Ghi nhận sóng điện tim phát hiện thiếu máu tim', 1),
('DV031', N'Đo Mật độ xương bằng phương pháp DEXA',    350000, N'Chẩn đoán mức độ loãng xương', 1),
('DV032', N'Nội soi Tai Mũi Họng ống mềm có hình ảnh', 300000, N'Nội soi phát hiện viêm xoang, polyp, thanh quản', 1),

-- Thủ thuật can thiệp điều trị
('DV033', N'Rửa xoang Proetz trị viêm xoang',          120000, N'Hút dịch rửa xoang bằng dung dịch kháng sinh', 1),
('DV034', N'Cạo vôi răng & Đánh bóng 2 hàm',          250000, N'Làm sạch cao răng mảng bám phòng ngừa nha chu', 1),
('DV035', N'Vật lý trị liệu: Kéo giãn cột sống & Chiếu tia hồng ngoại', 180000, N'Điều trị giảm đau nhức cơ xương khớp', 1);
GO

-- ====================================================================================================
-- 6. BẢNG LICH_HEN (160 Lịch hẹn: Hôm nay có hàng chờ, quá khứ có lịch khám hoàn thành)
-- ====================================================================================================
PRINT N'==> 6. Đang tạo 160 Lịch hẹn khám (Bao gồm hàng chờ khám hôm nay)...';

-- A. HÀNG CHỜ HÔM NAY (18 ca khám trải khắp các phòng bác sĩ để test màn hình Queue của Lễ tân & Bác sĩ)
INSERT INTO lich_hen (ma_lich_hen, ma_benh_nhan, ma_bac_si, thoi_gian_hen, so_thu_tu, trang_thai, ghi_chu) VALUES
('LH001', 'BN001', 'BS001', DATEADD(MINUTE,  30, CAST(CAST(GETDATE() AS DATE) AS DATETIME)), 1, N'Chờ khám',  N'Bệnh nhân đau đầu sốt nhẹ 2 ngày nay'),
('LH002', 'BN002', 'BS001', DATEADD(MINUTE,  60, CAST(CAST(GETDATE() AS DATE) AS DATETIME)), 2, N'Chờ khám',  N'Đau mỏi người, ho khan'),
('LH003', 'BN003', 'BS001', DATEADD(MINUTE,  90, CAST(CAST(GETDATE() AS DATE) AS DATETIME)), 3, N'Đang khám', N'Khám sức khỏe tổng quát định kỳ'),
('LH004', 'BN004', 'BS002', DATEADD(MINUTE,  45, CAST(CAST(GETDATE() AS DATE) AS DATETIME)), 1, N'Chờ khám',  N'Hồi hộp, thỉnh thoảng đau thắt ngực'),
('LH005', 'BN005', 'BS002', DATEADD(MINUTE,  75, CAST(CAST(GETDATE() AS DATE) AS DATETIME)), 2, N'Đang khám', N'Huyết áp đo tại nhà dao động 145/95'),
('LH006', 'BN006', 'BS003', DATEADD(MINUTE,  30, CAST(CAST(GETDATE() AS DATE) AS DATETIME)), 1, N'Chờ khám',  N'Đau rát họng nuốt vướng, nghẹt mũi'),
('LH007', 'BN007', 'BS003', DATEADD(MINUTE,  60, CAST(CAST(GETDATE() AS DATE) AS DATETIME)), 2, N'Chờ khám',  N'Ù tai trái, chảy dịch mũi xanh'),
('LH008', 'BN008', 'BS004', DATEADD(MINUTE,  40, CAST(CAST(GETDATE() AS DATE) AS DATETIME)), 1, N'Chờ khám',  N'Trẻ sốt 38.8 độ kèm biếng ăn, quấy khóc'),
('LH009', 'BN009', 'BS005', DATEADD(MINUTE,  50, CAST(CAST(GETDATE() AS DATE) AS DATETIME)), 1, N'Chờ khám',  N'Nổi mẩn ngứa đỏ 2 cánh tay sau khi ăn hải sản'),
('LH010', 'BN010', 'BS006', DATEADD(MINUTE,  35, CAST(CAST(GETDATE() AS DATE) AS DATETIME)), 1, N'Chờ khám',  N'Đau khớp gối phải khi lên xuống cầu thang'),
('LH011', 'BN011', 'BS006', DATEADD(MINUTE,  65, CAST(CAST(GETDATE() AS DATE) AS DATETIME)), 2, N'Đang khám', N'Đau nhức thắt lưng lan xuống mông'),
('LH012', 'BN012', 'BS007', DATEADD(MINUTE,  30, CAST(CAST(GETDATE() AS DATE) AS DATETIME)), 1, N'Chờ khám',  N'Đau âm ỉ vùng thượng vị, ợ chua nhiều'),
('LH013', 'BN013', 'BS008', DATEADD(MINUTE,  45, CAST(CAST(GETDATE() AS DATE) AS DATETIME)), 1, N'Chờ khám',  N'Đau nhức răng hàm dưới bên phải'),
('LH014', 'BN014', 'BS009', DATEADD(MINUTE,  50, CAST(CAST(GETDATE() AS DATE) AS DATETIME)), 1, N'Chờ khám',  N'Mắt mờ, cộm xốn đỏ nhiều'),
('LH015', 'BN015', 'BS010', DATEADD(MINUTE,  30, CAST(CAST(GETDATE() AS DATE) AS DATETIME)), 1, N'Chờ khám',  N'Mất ngủ kéo dài, chóng mặt tiền đình'),
('LH016', 'BN016', 'BS011', DATEADD(MINUTE,  60, CAST(CAST(GETDATE() AS DATE) AS DATETIME)), 1, N'Chờ khám',  N'Khó thở khi nằm, ho khan về đêm'),
('LH017', 'BN017', 'BS012', DATEADD(MINUTE,  40, CAST(CAST(GETDATE() AS DATE) AS DATETIME)), 1, N'Chờ khám',  N'Khát nước nhiều, sụt cân không rõ lý do'),
('LH018', 'BN018', 'BS015', DATEADD(MINUTE,  50, CAST(CAST(GETDATE() AS DATE) AS DATETIME)), 1, N'Chờ khám',  N'Tê bì hai bàn chân và mỏi cổ vai gáy');

-- B. 120 LỊCH HẸN TRONG QUÁ KHỨ (Trạng thái 'Đã khám', phục vụ báo cáo doanh thu & lịch sử bệnh án)
-- Sinh tự động 120 ca khám trải từ 60 ngày trước đến ngày hôm qua
DECLARE @i INT = 19;
DECLARE @curDate DATETIME;
DECLARE @bnId VARCHAR(20);
DECLARE @bsId VARCHAR(20);
DECLARE @stt INT;

WHILE @i <= 140
BEGIN
    SET @curDate = DATEADD(DAY, -((@i % 45) + 1), CAST(GETDATE() AS DATETIME));
    SET @curDate = DATEADD(HOUR, 8 + (@i % 8), @curDate);
    SET @curDate = DATEADD(MINUTE, (@i * 7) % 60, @curDate);

    SET @bnId = 'BN' + RIGHT('000' + CAST(((@i - 19) % 115) + 5 AS VARCHAR(10)), 3);
    SET @bsId = 'BS' + RIGHT('000' + CAST(((@i % 15) + 1) AS VARCHAR(10)), 3);
    SET @stt  = (@i % 10) + 1;

    INSERT INTO lich_hen (ma_lich_hen, ma_benh_nhan, ma_bac_si, thoi_gian_hen, so_thu_tu, trang_thai, ghi_chu)
    VALUES (
        'LH' + RIGHT('000' + CAST(@i AS VARCHAR(10)), 3),
        @bnId,
        @bsId,
        @curDate,
        @stt,
        N'Đã khám',
        N'Bệnh nhân tái khám theo hẹn'
    );
    SET @i = @i + 1;
END;

-- C. 20 LỊCH HẸN BỊ HỦY (Trạng thái 'Đã hủy', để test chức năng xem và kiểm tra lý do hủy)
WHILE @i <= 160
BEGIN
    SET @curDate = DATEADD(DAY, -((@i % 30) + 1), CAST(GETDATE() AS DATETIME));
    SET @curDate = DATEADD(HOUR, 9, @curDate);

    SET @bnId = 'BN' + RIGHT('000' + CAST((@i % 60) + 1 AS VARCHAR(10)), 3);
    SET @bsId = 'BS' + RIGHT('000' + CAST((@i % 5) + 1 AS VARCHAR(10)), 3);
    SET @stt  = (@i % 5) + 1;

    INSERT INTO lich_hen (ma_lich_hen, ma_benh_nhan, ma_bac_si, thoi_gian_hen, so_thu_tu, trang_thai, ghi_chu)
    VALUES (
        'LH' + RIGHT('000' + CAST(@i AS VARCHAR(10)), 3),
        @bnId,
        @bsId,
        @curDate,
        @stt,
        N'Đã hủy',
        CASE (@i % 4)
            WHEN 0 THEN N'Bệnh nhân bận công tác đột xuất xin hủy lịch'
            WHEN 1 THEN N'Bệnh nhân hết triệu chứng nên xin hủy khám'
            WHEN 2 THEN N'Bệnh nhân chuyển sang bệnh viện tuyến trên'
            ELSE N'Bệnh nhân không đến đúng giờ hẹn sau 3 lần gọi'
        END
    );
    SET @i = @i + 1;
END;
GO

-- ====================================================================================================
-- 7. BẢNG HO_SO_KHAM (122 Hồ sơ bệnh án tương ứng với 122 Lịch hẹn đã khám)
-- ====================================================================================================
PRINT N'==> 7. Đang nạp danh sách 122 Hồ sơ khám bệnh & Chẩn đoán y khoa...';

DECLARE @k INT = 19;
DECLARE @lhCode VARCHAR(20);
DECLARE @bnCode VARCHAR(20);
DECLARE @bsCode VARCHAR(20);
DECLARE @khamDate DATETIME;

WHILE @k <= 140
BEGIN
    SET @lhCode = 'LH' + RIGHT('000' + CAST(@k AS VARCHAR(10)), 3);
    
    SELECT @bnCode = ma_benh_nhan, @bsCode = ma_bac_si, @khamDate = thoi_gian_hen 
    FROM lich_hen WHERE ma_lich_hen = @lhCode;

    INSERT INTO ho_so_kham (ma_ho_so, ma_lich_hen, ma_benh_nhan, ma_bac_si, trieu_chung, chan_doan, loi_dan, ngay_kham)
    VALUES (
        'HS' + RIGHT('000' + CAST(@k - 18 AS VARCHAR(10)), 3),
        @lhCode,
        @bnCode,
        @bsCode,
        CASE (@k % 10)
            WHEN 0 THEN N'Sốt nhẹ 38 độ, ho có đờm trắng đục, nuốt đau họng, nghẹt mũi'
            WHEN 1 THEN N'Đau âm ỉ thượng vị lúc đói, ợ hơi, đầy trướng bụng, buồn nôn nhẹ'
            WHEN 2 THEN N'Chóng mặt hoa mắt khi thay đổi tư thế, đau nhức nửa đầu, khó ngủ'
            WHEN 3 THEN N'Huyết áp đo tại phòng khám 150/95 mmHg, nhức đầu sau gáy, hồi hộp'
            WHEN 4 THEN N'Đau nhức khớp gối hai bên khi đi bộ, cứng khớp buổi sáng khoảng 20 phút'
            WHEN 5 THEN N'Nổi dát đỏ ngứa nhiều vùng lưng và đùi sau khi dị ứng thời tiết'
            WHEN 6 THEN N'Mắt nhìn mờ, khô rát cộm mắt, chảy nước mắt sống khi dùng máy tính'
            WHEN 7 THEN N'Đau nhức răng hàm số 6 dưới bên trái, ê buốt nhiều khi uống nước lạnh'
            WHEN 8 THEN N'Ho khan từng cơn về đêm, nặng ngực, thở khò khè khi trời trở lạnh'
            ELSE N'Mệt mỏi toàn thân, ăn uống kém, sụt 2kg trong vòng 1 tháng qua'
        END,
        CASE (@k % 10)
            WHEN 0 THEN N'Viêm họng cấp tính kèm viêm phế quản nhẹ (J02.9)'
            WHEN 1 THEN N'Viêm loét dạ dày - tá tràng / Trào ngược dạ dày thực quản GERD (K21.9)'
            WHEN 2 THEN N'Rối loạn tuần hoàn não - Hội chứng tiền đình (H81.9)'
            WHEN 3 THEN N'Tăng huyết áp nguyên phát giai đoạn 2 (I10)'
            WHEN 4 THEN N'Thoái hóa khớp gối nguyên phát độ 2 (M17.0)'
            WHEN 5 THEN N'Mày đay cấp tính / Viêm da dị ứng tiếp xúc (L50.0)'
            WHEN 6 THEN N'Hội chứng khô mắt / Tật khúc xạ viễn loạn thị (H04.1)'
            WHEN 7 THEN N'Sâu ngà răng hàm - Viêm tủy răng hồi phục (K02.1)'
            WHEN 8 THEN N'Hen phế quản bội nhiễm / Viêm phế quản co thắt (J45.9)'
            ELSE N'Suy nhược cơ thể / Rối loạn lipid máu hỗn hợp (E78.2)'
        END,
        CASE (@k % 5)
            WHEN 0 THEN N'Uống thuốc đúng giờ theo đơn, uống nhiều nước ấm, kiêng nước đá lạnh, tái khám sau 7 ngày'
            WHEN 1 THEN N'Ăn đúng bữa, không ăn cay nóng chua, không nằm ngay sau khi ăn, tái khám sau 14 ngày'
            WHEN 2 THEN N'Hạn chế đồ mặn, giảm mỡ động vật, đo huyết áp mỗi sáng ghi sổ theo dõi, tránh thức khuya'
            WHEN 3 THEN N'Tập thể dục nhẹ nhàng, tránh mang vác nặng, chườm ấm khớp gối mỗi tối 15 phút'
            ELSE N'Nghỉ ngơi điều độ, ăn nhiều rau xanh trái cây, uống đủ 2 lít nước mỗi ngày, tái khám khi có bất thường'
        END,
        @khamDate
    );

    SET @k = @k + 1;
END;
GO

-- ====================================================================================================
-- 8. BẢNG CHI_DINH_DICH_VU (200+ Chỉ định xét nghiệm, siêu âm, X-quang)
-- ====================================================================================================
PRINT N'==> 8. Đang nạp danh sách 220 Chỉ định cận lâm sàng...';

DECLARE @h INT = 1;
DECLARE @hsCode VARCHAR(20);
DECLARE @cdIndex INT = 1;

WHILE @h <= 122
BEGIN
    SET @hsCode = 'HS' + RIGHT('000' + CAST(@h AS VARCHAR(10)), 3);

    -- Mỗi hồ sơ có từ 1 đến 3 dịch vụ cận lâm sàng tùy ca bệnh
    -- Dịch vụ 1: Xét nghiệm máu hoặc Khám
    INSERT INTO chi_dinh_dich_vu (ma_chi_dinh, ma_ho_so, ma_dich_vu, so_luong, don_gia, trang_thai, ket_qua)
    VALUES (
        'CD' + RIGHT('000' + CAST(@cdIndex AS VARCHAR(10)), 3),
        @hsCode,
        CASE (@h % 6)
            WHEN 0 THEN 'DV011' -- Xét nghiệm máu
            WHEN 1 THEN 'DV014' -- Chức năng gan
            WHEN 2 THEN 'DV016' -- Mỡ máu
            WHEN 3 THEN 'DV012' -- Đường huyết
            WHEN 4 THEN 'DV030' -- Đo điện tim ECG
            ELSE 'DV023'        -- X-quang tim phổi
        END,
        1,
        CASE (@h % 6)
            WHEN 0 THEN 150000
            WHEN 1 THEN 160000
            WHEN 2 THEN 220000
            WHEN 3 THEN  60000
            WHEN 4 THEN 100000
            ELSE 180000
        END,
        N'Đã có kết quả',
        CASE (@h % 6)
            WHEN 0 THEN N'Bạch cầu 7.8 K/uL, Hồng cầu 4.5 M/uL, Tiểu cầu 250 K/uL - Bình thường'
            WHEN 1 THEN N'AST: 32 U/L, ALT: 38 U/L, GGT: 40 U/L - Chức năng gan trong giới hạn'
            WHEN 2 THEN N'Cholesterol toàn phần: 5.8 mmol/L, Triglycerid: 2.2 mmol/L (Hơi cao)'
            WHEN 3 THEN N'Glucose đói: 5.6 mmol/L - Mức đường huyết ổn định'
            WHEN 4 THEN N'Nhịp xoang đều tần số 78 lần/phút, không thấy dấu hiệu thiếu máu cơ tim cấp'
            ELSE N'Hình ảnh phế trường 2 bên sáng đều, rốn phổi bình thường, bóng tim không to'
        END
    );
    SET @cdIndex = @cdIndex + 1;

    -- Dịch vụ 2: Siêu âm hoặc X-quang bổ sung cho các ca chẵn
    IF (@h % 2 = 0)
    BEGIN
        INSERT INTO chi_dinh_dich_vu (ma_chi_dinh, ma_ho_so, ma_dich_vu, so_luong, don_gia, trang_thai, ket_qua)
        VALUES (
            'CD' + RIGHT('000' + CAST(@cdIndex AS VARCHAR(10)), 3),
            @hsCode,
            CASE (@h % 4)
                WHEN 0 THEN 'DV026' -- Siêu âm bụng
                WHEN 2 THEN 'DV025' -- X-quang khớp gối
                ELSE 'DV032'        -- Nội soi TMH
            END,
            1,
            CASE (@h % 4)
                WHEN 0 THEN 250000
                WHEN 2 THEN 200000
                ELSE 300000
            END,
            N'Đã có kết quả',
            CASE (@h % 4)
                WHEN 0 THEN N'Gan nhiễm mỡ độ 1 nhẹ, thận và bàng quang không sỏi, lách bình thường'
                WHEN 2 THEN N'Hẹp nhẹ khe khớp gối trong, có gai xương nhỏ rìa khớp, không tràn dịch'
                ELSE N'Niêm mạc họng đỏ xung huyết, amidan 2 bên quá phát độ 1, không có giả mạc'
            END
        );
        SET @cdIndex = @cdIndex + 1;
    END;

    SET @h = @h + 1;
END;
GO

-- ====================================================================================================
-- 9. BẢNG DON_THUOC (300+ Thuốc được kê cho 122 Hồ sơ bệnh án)
-- ====================================================================================================
PRINT N'==> 9. Đang nạp danh sách 320 Chi tiết đơn thuốc kê cho bệnh nhân...';

DECLARE @m INT = 1;
DECLARE @hs VARCHAR(20);
DECLARE @dtId INT = 1;

WHILE @m <= 122
BEGIN
    SET @hs = 'HS' + RIGHT('000' + CAST(@m AS VARCHAR(10)), 3);

    -- Thuốc 1: Hạ sốt hoặc Giảm đau hoặc Thuốc đặc trị
    INSERT INTO don_thuoc (ma_don_thuoc, ma_ho_so, ma_thuoc, so_luong, cach_dung, huong_dan)
    VALUES (
        'DT' + RIGHT('000' + CAST(@dtId AS VARCHAR(10)), 3),
        @hs,
        CASE (@m % 8)
            WHEN 0 THEN 'T001' -- Panadol
            WHEN 1 THEN 'T021' -- Nexium
            WHEN 2 THEN 'T051' -- Tanakan
            WHEN 3 THEN 'T031' -- Amlodipine
            WHEN 4 THEN 'T005' -- Celebrex
            WHEN 5 THEN 'T041' -- Telfast
            WHEN 6 THEN 'T049' -- Dorithricin
            ELSE 'T011'        -- Amoxicillin
        END,
        CASE (@m % 8)
            WHEN 0 THEN 10
            WHEN 1 THEN 14
            WHEN 2 THEN 20
            WHEN 3 THEN 30
            WHEN 4 THEN 10
            WHEN 5 THEN 10
            WHEN 6 THEN 12
            ELSE 14
        END,
        CASE (@m % 8)
            WHEN 0 THEN N'Ngày uống 2 lần, mỗi lần 1 viên sau ăn khi sốt hoặc đau'
            WHEN 1 THEN N'Ngày uống 1 lần 1 viên trước ăn sáng 30 phút'
            WHEN 2 THEN N'Ngày uống 2 lần, mỗi lần 1 viên sau ăn sáng - chiều'
            WHEN 3 THEN N'Ngày uống 1 lần 1 viên cố định vào buổi sáng'
            WHEN 4 THEN N'Ngày uống 1 lần 1 viên sau bữa ăn no'
            WHEN 5 THEN N'Ngày uống 1 lần 1 viên trước khi đi ngủ tối'
            WHEN 6 THEN N'Ngậm 1 viên mỗi 4 tiếng khi rát họng'
            ELSE N'Ngày uống 2 lần, mỗi lần 1 viên cách nhau 12 tiếng'
        END,
        N'Uống với nhiều nước lọc'
    );
    SET @dtId = @dtId + 1;

    -- Thuốc 2: Thuốc hỗ trợ kèm theo (Kháng viêm, Dạ dày, Men vi sinh)
    INSERT INTO don_thuoc (ma_don_thuoc, ma_ho_so, ma_thuoc, so_luong, cach_dung, huong_dan)
    VALUES (
        'DT' + RIGHT('000' + CAST(@dtId AS VARCHAR(10)), 3),
        @hs,
        CASE (@m % 6)
            WHEN 0 THEN 'T007' -- Alpha Choay
            WHEN 1 THEN 'T024' -- Gaviscon
            WHEN 2 THEN 'T055' -- Mag B6
            WHEN 3 THEN 'T036' -- Lipitor
            WHEN 4 THEN 'T046' -- Bisolvon
            ELSE 'T061'        -- Vitamin C
        END,
        CASE (@m % 6)
            WHEN 0 THEN 20
            WHEN 1 THEN 10
            WHEN 2 THEN 20
            WHEN 3 THEN 30
            WHEN 4 THEN 15
            ELSE 10
        END,
        CASE (@m % 6)
            WHEN 0 THEN N'Ngậm dưới lưỡi ngày 2 lần, mỗi lần 2 viên'
            WHEN 1 THEN N'Uống 1 gói sau bữa ăn trưa và tối'
            WHEN 2 THEN N'Ngày 2 lần, mỗi lần 1 viên sau ăn'
            WHEN 3 THEN N'Uống 1 viên vào buổi tối trước khi ngủ'
            WHEN 4 THEN N'Ngày uống 3 lần, mỗi lần 1 viên sau ăn'
            ELSE N'Ngày uống 1 viên hòa tan nước sau ăn sáng'
        END,
        N'Theo đúng chỉ dẫn của bác sĩ'
    );
    SET @dtId = @dtId + 1;

    -- Thuốc 3: Vitamin / Bổ não cho các ca lẻ
    IF (@m % 2 = 1)
    BEGIN
        INSERT INTO don_thuoc (ma_don_thuoc, ma_ho_so, ma_thuoc, so_luong, cach_dung, huong_dan)
        VALUES (
            'DT' + RIGHT('000' + CAST(@dtId AS VARCHAR(10)), 3),
            @hs,
            CASE (@m % 3)
                WHEN 0 THEN 'T062' -- 3B
                WHEN 1 THEN 'T028' -- Enterogermina
                ELSE 'T066'        -- Dầu cá Omega 3
            END,
            CASE (@m % 3)
                WHEN 0 THEN 20
                WHEN 1 THEN 10
                ELSE 30
            END,
            CASE (@m % 3)
                WHEN 0 THEN N'Ngày uống 2 lần, mỗi lần 1 viên sau ăn'
                WHEN 1 THEN N'Lắc kỹ uống trực tiếp ngày 1 ống'
                ELSE N'Ngày uống 1 viên vào buổi trưa'
            END,
            N'Bổ sung dinh dưỡng'
        );
        SET @dtId = @dtId + 1;
    END;

    SET @m = @m + 1;
END;
GO

-- ====================================================================================================
-- 10. BẢNG HOA_DON (122 Hóa đơn viện phí chuẩn xác: Tổng = Dịch vụ + Thuốc - Giảm giá)
-- ====================================================================================================
PRINT N'==> 10. Đang tính toán và chốt 122 Hóa đơn viện phí thực tế...';

INSERT INTO hoa_don (ma_hoa_don, ma_ho_so, tien_dich_vu, tien_thuoc, tien_giam_gia, tong_tien, hinh_thuc_thanh_toan, trang_thai, ngay_lap)
SELECT 
    'HD' + RIGHT('000' + CAST(ROW_NUMBER() OVER(ORDER BY hs.ma_ho_so) AS VARCHAR(10)), 3) AS ma_hoa_don,
    hs.ma_ho_so,
    ISNULL(cd_sum.tong_dv, 0) AS tien_dich_vu,
    ISNULL(dt_sum.tong_thuoc, 0) AS tien_thuoc,
    CASE 
        WHEN (ROW_NUMBER() OVER(ORDER BY hs.ma_ho_so)) % 5 = 0 THEN 50000 -- Có voucher giảm giá 50k
        WHEN (ROW_NUMBER() OVER(ORDER BY hs.ma_ho_so)) % 9 = 0 THEN 100000 -- Có voucher giảm giá 100k
        ELSE 0 
    END AS tien_giam_gia,
    -- tong_tien = (tien_dich_vu + tien_thuoc - tien_giam_gia) đảm bảo khớp tuyệt đối với ràng buộc CK_hoa_don_tong_tien
    (ISNULL(cd_sum.tong_dv, 0) + ISNULL(dt_sum.tong_thuoc, 0) - 
     CASE 
        WHEN (ROW_NUMBER() OVER(ORDER BY hs.ma_ho_so)) % 5 = 0 THEN 50000 
        WHEN (ROW_NUMBER() OVER(ORDER BY hs.ma_ho_so)) % 9 = 0 THEN 100000 
        ELSE 0 
     END) AS tong_tien,
    CASE ((ROW_NUMBER() OVER(ORDER BY hs.ma_ho_so)) % 3)
        WHEN 0 THEN N'Tiền mặt'
        WHEN 1 THEN N'Chuyển khoản'
        ELSE N'Thẻ'
    END AS hinh_thuc_thanh_toan,
    N'Đã thanh toán' AS trang_thai,
    hs.ngay_kham AS ngay_lap
FROM ho_so_kham hs
LEFT JOIN (
    SELECT ma_ho_so, SUM(don_gia * so_luong) AS tong_dv 
    FROM chi_dinh_dich_vu GROUP BY ma_ho_so
) cd_sum ON hs.ma_ho_so = cd_sum.ma_ho_so
LEFT JOIN (
    SELECT dt.ma_ho_so, SUM(t.don_gia * dt.so_luong) AS tong_thuoc 
    FROM don_thuoc dt 
    JOIN thuoc t ON dt.ma_thuoc = t.ma_thuoc 
    GROUP BY dt.ma_ho_so
) dt_sum ON hs.ma_ho_so = dt_sum.ma_ho_so;
GO

-- ====================================================================================================
-- 11. CẬP NHẬT LẠI CÁC SEQUENCE ĐỂ KHÔNG BỊ XUNG ĐỘT KHI NGƯỜI DÙNG THỰC HIỆN TẠO MỚI TRÊN WEB
-- ====================================================================================================
PRINT N'==> 11. Đang tái khởi động các Sequence sinh mã tự động...';

ALTER SEQUENCE seq_nguoi_dung RESTART WITH 100;
ALTER SEQUENCE seq_bac_si     RESTART WITH 100;
ALTER SEQUENCE seq_benh_nhan  RESTART WITH 300;
ALTER SEQUENCE seq_thuoc      RESTART WITH 200;
ALTER SEQUENCE seq_dich_vu    RESTART WITH 100;
ALTER SEQUENCE seq_lich_hen   RESTART WITH 300;
ALTER SEQUENCE seq_ho_so      RESTART WITH 300;
ALTER SEQUENCE seq_chi_dinh   RESTART WITH 500;
ALTER SEQUENCE seq_don_thuoc  RESTART WITH 800;
ALTER SEQUENCE seq_hoa_don    RESTART WITH 300;
GO

-- ====================================================================================================
-- 12. BẬT LẠI TOÀN BỘ RÀNG BUỘC TOÀN VẸN & TRIGGERS
-- ====================================================================================================
PRINT N'==> 12. Kích hoạt lại toàn bộ Ràng buộc toàn vẹn & Triggers...';

ALTER TABLE nguoi_dung CHECK CONSTRAINT ALL;
ALTER TABLE bac_si CHECK CONSTRAINT ALL;
ALTER TABLE benh_nhan CHECK CONSTRAINT ALL;
ALTER TABLE thuoc CHECK CONSTRAINT ALL;
ALTER TABLE dich_vu CHECK CONSTRAINT ALL;
ALTER TABLE lich_hen CHECK CONSTRAINT ALL;
ALTER TABLE ho_so_kham CHECK CONSTRAINT ALL;
ALTER TABLE chi_dinh_dich_vu CHECK CONSTRAINT ALL;
ALTER TABLE don_thuoc CHECK CONSTRAINT ALL;
ALTER TABLE hoa_don CHECK CONSTRAINT ALL;

IF OBJECT_ID('dbo.trg_ke_don_tru_kho', 'TR') IS NOT NULL ENABLE TRIGGER dbo.trg_ke_don_tru_kho ON don_thuoc;
IF OBJECT_ID('dbo.trg_kiem_tra_han_thuoc', 'TR') IS NOT NULL ENABLE TRIGGER dbo.trg_kiem_tra_han_thuoc ON don_thuoc;
IF OBJECT_ID('dbo.trg_xoa_don_hoan_kho', 'TR') IS NOT NULL ENABLE TRIGGER dbo.trg_xoa_don_hoan_kho ON don_thuoc;
IF OBJECT_ID('dbo.trg_hoan_thanh_lich_kham', 'TR') IS NOT NULL ENABLE TRIGGER dbo.trg_hoan_thanh_lich_kham ON ho_so_kham;
GO

-- ====================================================================================================
-- 13. XUẤT THỐNG KÊ TỔNG KẾT
-- ====================================================================================================
PRINT N'';
PRINT N'===================================================================================';
PRINT N'           KẾT QUẢ KHỞI TẠO BỘ DỮ LIỆU MẪU LỚN CHO DỰ ÁN PHÒNG KHÁM               ';
PRINT N'===================================================================================';

SELECT N'Người dùng hệ thống (Admin, Bác sĩ, Lễ tân, Dược sĩ)' AS [Đối tượng], COUNT(*) AS [Tổng số lượng] FROM nguoi_dung
UNION ALL
SELECT N'Bác sĩ chuyên khoa (15 Phòng khám)', COUNT(*) FROM bac_si
UNION ALL
SELECT N'Hồ sơ bệnh nhân (CCCD, SĐT, Địa chỉ thực tế)', COUNT(*) FROM benh_nhan
UNION ALL
SELECT N'Danh mục thuốc & Dược phẩm (Kho thuốc)', COUNT(*) FROM thuoc
UNION ALL
SELECT N'Danh mục dịch vụ y tế & Cận lâm sàng', COUNT(*) FROM dich_vu
UNION ALL
SELECT N'Lịch hẹn khám (Hàng chờ hôm nay + Quá khứ)', COUNT(*) FROM lich_hen
UNION ALL
SELECT N'Hồ sơ khám bệnh (Triệu chứng & Chẩn đoán)', COUNT(*) FROM ho_so_kham
UNION ALL
SELECT N'Chỉ định cận lâm sàng (Có kết quả)', COUNT(*) FROM chi_dinh_dich_vu
UNION ALL
SELECT N'Đơn thuốc kê chi tiết', COUNT(*) FROM don_thuoc
UNION ALL
SELECT N'Hóa đơn viện phí (Đã chốt thanh toán)', COUNT(*) FROM hoa_don;

PRINT N'';
PRINT N'>>> ĐÃ NẠP DỮ LIỆU MẪU KHỔNG LỒ THÀNH CÔNG VÀ SẴN SÀNG DEMO ĐỒ ÁN! <<<';
GO
