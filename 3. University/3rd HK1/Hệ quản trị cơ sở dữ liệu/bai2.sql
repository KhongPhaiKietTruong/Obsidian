CREATE DATABASE QLGV;
GO

USE QLGV;
GO

/*==============================================================
    SAMPLE DATA FROM THE EXERCISE

    IMPORTANT:
    Some supplied sample rows conflict with later trigger rules
    such as CAU 10, 15/22, 23.

    Therefore temporarily disable triggers while loading
    the original exercise data.
==============================================================*/

DISABLE TRIGGER ALL ON KHOA;
DISABLE TRIGGER ALL ON MONHOC;
DISABLE TRIGGER ALL ON DIEUKIEN;
DISABLE TRIGGER ALL ON GIAOVIEN;
DISABLE TRIGGER ALL ON LOP;
DISABLE TRIGGER ALL ON HOCVIEN;
DISABLE TRIGGER ALL ON GIANGDAY;
DISABLE TRIGGER ALL ON KETQUATHI;
GO


/*==============================================================
    1. INSERT KHOA

    TRGKHOA must initially be NULL because GIAOVIEN
    has not been inserted yet.
==============================================================*/

INSERT INTO KHOA (MAKHOA, TENKHOA, NGTLAP, TRGKHOA)
VALUES
('KHMT', 'Khoa hoc may tinh',       '20050607', NULL),
('HTTT', 'He thong thong tin',      '20050607', NULL),
('CNPM', 'Cong nghe phan mem',      '20050607', NULL),
('MTT',  'Mang va truyen thong',    '20051020', NULL),
('KTMT', 'Ky thuat may tinh',       '20051220', NULL);
GO


/*==============================================================
    2. INSERT GIAOVIEN
==============================================================*/

INSERT INTO GIAOVIEN
(
    MAGV,
    HOTEN,
    HOCVI,
    HOCHAM,
    GIOITINH,
    NGSINH,
    NGVL,
    HESO,
    MUCLUONG,
    MAKHOA
)
VALUES
('GV01', 'Ho Thanh Son',      'PTS', 'GS',  'Nam', '19500502', '20040111', 5.00, 2250000, 'KHMT'),
('GV02', 'Tran Tam Thanh',    'TS',  'PGS', 'Nam', '19651217', '20040420', 4.50, 2025000, 'HTTT'),
('GV03', 'Do Nghiem Phung',   'TS',  'GS',  'Nu',  '19500801', '20040923', 4.00, 1800000, 'CNPM'),
('GV04', 'Tran Nam Son',      'TS',  'PGS', 'Nam', '19610222', '20050112', 4.50, 2025000, 'KTMT'),
('GV05', 'Mai Thanh Danh',    'ThS', 'GV',  'Nam', '19580312', '20050112', 3.00, 1350000, 'HTTT'),
('GV06', 'Tran Doan Hung',    'TS',  'GV',  'Nam', '19530311', '20050112', 4.50, 2025000, 'KHMT'),
('GV07', 'Nguyen Minh Tien',  'ThS', 'GV',  'Nam', '19711123', '20050301', 4.00, 1800000, 'KHMT'),
('GV08', 'Le Thi Tran',       'KS',  NULL,  'Nu',  '19740326', '20050301', 1.69, 760500,  'KHMT'),
('GV09', 'Nguyen To Lan',     'ThS', 'GV',  'Nu',  '19661231', '20050301', 4.00, 1800000, 'HTTT'),
('GV10', 'Le Tran Anh Loan',  'KS',  NULL,  'Nu',  '19720717', '20050301', 1.86, 837000,  'CNPM'),
('GV11', 'Ho Thanh Tung',     'CN',  'GV',  'Nam', '19800112', '20050515', 2.67, 1201500, 'MTT'),
('GV12', 'Tran Van Anh',      'CN',  NULL,  'Nu',  '19810329', '20050515', 1.69, 760500,  'CNPM'),
('GV13', 'Nguyen Linh Dan',   'CN',  NULL,  'Nu',  '19800523', '20050515', 1.69, 760500,  'KTMT'),
('GV14', 'Truong Minh Chau',  'ThS', 'GV',  'Nu',  '19761130', '20050515', 3.00, 1350000, 'MTT'),
('GV15', 'Le Ha Thanh',       'ThS', 'GV',  'Nam', '19780504', '20050515', 3.00, 1350000, 'KHMT');
GO


/*==============================================================
    3. UPDATE TRUONG KHOA

    Now GIAOVIEN exists, so TRGKHOA can reference MAGV.
==============================================================*/

UPDATE KHOA
SET TRGKHOA = 'GV01'
WHERE MAKHOA = 'KHMT';

UPDATE KHOA
SET TRGKHOA = 'GV02'
WHERE MAKHOA = 'HTTT';

UPDATE KHOA
SET TRGKHOA = 'GV04'
WHERE MAKHOA = 'CNPM';

UPDATE KHOA
SET TRGKHOA = 'GV03'
WHERE MAKHOA = 'MTT';

-- KTMT has no department head in the supplied data.
GO


/*==============================================================
    4. INSERT LOP

    TRGLOP is initially NULL because HOCVIEN
    has not been inserted yet.
==============================================================*/

INSERT INTO LOP
(
    MALOP,
    TENLOP,
    TRGLOP,
    SISO,
    MAGVCN
)
VALUES
('K11', 'Lop 1 khoa 1', NULL, 11, 'GV07'),
('K12', 'Lop 2 khoa 1', NULL, 12, 'GV09'),
('K13', 'Lop 3 khoa 1', NULL, 12, 'GV14');
GO


/*==============================================================
    5. INSERT HOCVIEN
==============================================================*/

INSERT INTO HOCVIEN
(
    MAHV,
    HO,
    TEN,
    NGSINH,
    GIOITINH,
    NOISINH,
    MALOP
)
VALUES

-- ==================== K11 ====================

('K1101', 'Nguyen Van',       'A',     '19860127', 'Nam', 'TpHCM',      'K11'),
('K1102', 'Tran Ngoc',        'Han',   '19860314', 'Nu',  'Kien Giang', 'K11'),
('K1103', 'Ha Duy',           'Lap',   '19860418', 'Nam', 'Nghe An',    'K11'),
('K1104', 'Tran Ngoc',        'Linh',  '19860330', 'Nu',  'Tay Ninh',   'K11'),
('K1105', 'Tran Minh',        'Long',  '19860227', 'Nam', 'TpHCM',      'K11'),
('K1106', 'Le Nhat',          'Minh',  '19860124', 'Nam', 'TpHCM',      'K11'),
('K1107', 'Nguyen Nhu',       'Nhut',  '19860127', 'Nam', 'Ha Noi',     'K11'),
('K1108', 'Nguyen Manh',      'Tam',   '19860227', 'Nam', 'Kien Giang', 'K11'),
('K1109', 'Phan Thi Thanh',   'Tam',   '19860127', 'Nu',  'Vinh Long',  'K11'),
('K1110', 'Le Hoai',          'Thuong','19860205', 'Nu',  'Can Tho',    'K11'),
('K1111', 'Le Ha',            'Vinh',  '19861225', 'Nam', 'Vinh Long',  'K11'),

-- ==================== K12 ====================

('K1201', 'Nguyen Van',       'B',     '19860211', 'Nam', 'TpHCM',      'K12'),
('K1202', 'Nguyen Thi Kim',   'Da',    '19860118', 'Nu',  'TpHCM',      'K12'),
('K1203', 'Tran Thi Kim',     'Duyen', '19860917', 'Nu',  'TpHCM',      'K12'),
('K1204', 'Truong My',        'Hanh',  '19860519', 'Nu',  'Dong Nai',   'K12'),
('K1205', 'Nguyen Thanh',     'Nam',   '19860417', 'Nam', 'TpHCM',      'K12'),
('K1206', 'Nguyen Thi Truc',  'Thanh', '19860304', 'Nu',  'Kien Giang', 'K12'),
('K1207', 'Tran Thi Bich',    'Thuy',  '19860208', 'Nu',  'Nghe An',    'K12'),
('K1208', 'Huynh Thi Kim',    'Trieu', '19860408', 'Nu',  'Tay Ninh',   'K12'),
('K1209', 'Pham Thanh',       'Trieu', '19860223', 'Nam', 'TpHCM',      'K12'),
('K1210', 'Ngo Thanh',        'Tuan',  '19860214', 'Nam', 'TpHCM',      'K12'),
('K1211', 'Do Thi',           'Xuan',  '19860309', 'Nu',  'Ha Noi',     'K12'),
('K1212', 'Le Thi Phi',       'Yen',   '19860312', 'Nu',  'TpHCM',      'K12'),

-- ==================== K13 ====================

('K1301', 'Nguyen Thi Kim',   'Cuc',   '19860609', 'Nu',  'Kien Giang', 'K13'),
('K1302', 'Truong Thi My',    'Hien',  '19860318', 'Nu',  'Nghe An',    'K13'),
('K1303', 'Le Duc',           'Hien',  '19860321', 'Nam', 'Tay Ninh',   'K13'),
('K1304', 'Le Quang',         'Hien',  '19860418', 'Nam', 'TpHCM',      'K13'),
('K1305', 'Le Thi',           'Huong', '19860327', 'Nu',  'TpHCM',      'K13'),
('K1306', 'Nguyen Thai',      'Huu',   '19860330', 'Nam', 'Ha Noi',     'K13'),
('K1307', 'Tran Minh',        'Man',   '19860528', 'Nam', 'TpHCM',      'K13'),
('K1308', 'Nguyen Hieu',      'Nghia', '19860408', 'Nam', 'Kien Giang', 'K13'),
('K1309', 'Nguyen Trung',     'Nghia', '19870118', 'Nam', 'Nghe An',    'K13'),
('K1310', 'Tran Thi Hong',    'Tham',  '19860422', 'Nu',  'Tay Ninh',   'K13'),
('K1311', 'Tran Minh',        'Thuc',  '19860404', 'Nam', 'TpHCM',      'K13'),
('K1312', 'Nguyen Thi Kim',   'Yen',   '19860907', 'Nu',  'TpHCM',      'K13');
GO


/*==============================================================
    6. UPDATE LOP TRUONG

    HOCVIEN now exists.
==============================================================*/

UPDATE LOP
SET TRGLOP = 'K1108'
WHERE MALOP = 'K11';

UPDATE LOP
SET TRGLOP = 'K1205'
WHERE MALOP = 'K12';

UPDATE LOP
SET TRGLOP = 'K1305'
WHERE MALOP = 'K13';
GO


/*==============================================================
    7. INSERT MONHOC
==============================================================*/

INSERT INTO MONHOC
(
    MAMH,
    TENMH,
    TCLT,
    TCTH,
    MAKHOA
)
VALUES
('THDC',     'Tin hoc dai cuong',                       4, 1, 'KHMT'),
('CTRR',     'Cau truc roi rac',                        5, 0, 'KHMT'),
('CSDL',     'Co so du lieu',                           3, 1, 'HTTT'),
('CTDLGT',   'Cau truc du lieu va giai thuat',          3, 1, 'KHMT'),
('PTTKTT',   'Phan tich thiet ke thuat toan',           3, 0, 'KHMT'),
('DHMT',     'Do hoa may tinh',                         3, 1, 'KHMT'),
('KTMT',     'Kien truc may tinh',                      3, 0, 'KTMT'),
('TKCSDL',   'Thiet ke co so du lieu',                  3, 1, 'HTTT'),
('PTTKHTTT', 'Phan tich thiet ke he thong thong tin',   4, 1, 'HTTT'),
('HDH',      'He dieu hanh',                            4, 0, 'KTMT'),
('NMCNPM',   'Nhap mon cong nghe phan mem',             3, 0, 'CNPM'),
('LTCFW',    'Lap trinh C for win',                     3, 1, 'CNPM'),
('LTHDT',    'Lap trinh huong doi tuong',               3, 1, 'CNPM');
GO


/*==============================================================
    8. INSERT DIEUKIEN
==============================================================*/

INSERT INTO DIEUKIEN (MAMH, MAMH_TRUOC)
VALUES
('CSDL',     'CTRR'),
('CSDL',     'CTDLGT'),
('CTDLGT',   'THDC'),
('PTTKTT',   'THDC'),
('PTTKTT',   'CTDLGT'),
('DHMT',     'THDC'),
('LTHDT',    'THDC'),
('PTTKHTTT', 'CSDL');
GO


/*==============================================================
    9. INSERT GIANGDAY
==============================================================*/

INSERT INTO GIANGDAY
(
    MALOP,
    MAMH,
    MAGV,
    HOCKY,
    NAM,
    TUNGAY,
    DENNGAY
)
VALUES
('K11', 'THDC',   'GV07', 1, 2006, '20060102', '20060512'),
('K12', 'THDC',   'GV06', 1, 2006, '20060102', '20060512'),
('K13', 'THDC',   'GV15', 1, 2006, '20060102', '20060512'),

('K11', 'CTRR',   'GV02', 1, 2006, '20060109', '20060517'),
('K12', 'CTRR',   'GV02', 1, 2006, '20060109', '20060517'),
('K13', 'CTRR',   'GV08', 1, 2006, '20060109', '20060517'),

('K11', 'CSDL',   'GV05', 2, 2006, '20060601', '20060715'),
('K12', 'CSDL',   'GV09', 2, 2006, '20060601', '20060715'),
('K13', 'CTDLGT', 'GV15', 2, 2006, '20060601', '20060715'),

('K13', 'CSDL',   'GV05', 3, 2006, '20060801', '20061215'),
('K13', 'DHMT',   'GV07', 3, 2006, '20060801', '20061215'),
('K11', 'CTDLGT', 'GV15', 3, 2006, '20060801', '20061215'),
('K12', 'CTDLGT', 'GV15', 3, 2006, '20060801', '20061215'),

('K11', 'HDH',    'GV04', 1, 2007, '20070102', '20070218'),
('K12', 'HDH',    'GV04', 1, 2007, '20070102', '20070320'),
('K11', 'DHMT',   'GV07', 1, 2007, '20070218', '20070320');
GO


/*==============================================================
    10. INSERT KETQUATHI
==============================================================*/

INSERT INTO KETQUATHI
(
    MAHV,
    MAMH,
    LANTHI,
    NGTHI,
    DIEM,
    KQUA
)
VALUES

/* ==================== K1101 ==================== */

('K1101', 'CSDL',   1, '20060720', 10.00, 'Dat'),
('K1101', 'CTDLGT', 1, '20061228',  9.00, 'Dat'),
('K1101', 'THDC',   1, '20060520',  9.00, 'Dat'),
('K1101', 'CTRR',   1, '20060513',  9.50, 'Dat'),


/* ==================== K1102 ==================== */

('K1102', 'CSDL',   1, '20060720', 4.00, 'Khong Dat'),
('K1102', 'CSDL',   2, '20060727', 4.25, 'Khong Dat'),
('K1102', 'CSDL',   3, '20060810', 4.50, 'Khong Dat'),

('K1102', 'CTDLGT', 1, '20061228', 4.50, 'Khong Dat'),
('K1102', 'CTDLGT', 2, '20070105', 4.00, 'Khong Dat'),
('K1102', 'CTDLGT', 3, '20070115', 6.00, 'Dat'),

('K1102', 'THDC',   1, '20060520', 5.00, 'Dat'),
('K1102', 'CTRR',   1, '20060513', 7.00, 'Dat'),


/* ==================== K1103 ==================== */

('K1103', 'CSDL',   1, '20060720', 3.50, 'Khong Dat'),
('K1103', 'CSDL',   2, '20060727', 8.25, 'Dat'),

('K1103', 'CTDLGT', 1, '20061228', 7.00, 'Dat'),
('K1103', 'THDC',   1, '20060520', 8.00, 'Dat'),
('K1103', 'CTRR',   1, '20060513', 6.50, 'Dat'),


/* ==================== K1104 ==================== */

('K1104', 'CSDL',   1, '20060720', 3.75, 'Khong Dat'),
('K1104', 'CTDLGT', 1, '20061228', 4.00, 'Khong Dat'),
('K1104', 'THDC',   1, '20060520', 4.00, 'Khong Dat'),

('K1104', 'CTRR',   1, '20060513', 4.00, 'Khong Dat'),
('K1104', 'CTRR',   2, '20060520', 3.50, 'Khong Dat'),
('K1104', 'CTRR',   3, '20060630', 4.00, 'Khong Dat'),


/* ==================== K1201 ==================== */

('K1201', 'CSDL',   1, '20060720', 6.00, 'Dat'),
('K1201', 'CTDLGT', 1, '20061228', 5.00, 'Dat'),
('K1201', 'THDC',   1, '20060520', 8.50, 'Dat'),
('K1201', 'CTRR',   1, '20060513', 9.00, 'Dat'),


/* ==================== K1202 ==================== */

('K1202', 'CSDL',   1, '20060720', 8.00, 'Dat'),

('K1202', 'CTDLGT', 1, '20061228', 4.00, 'Khong Dat'),
('K1202', 'CTDLGT', 2, '20070105', 5.00, 'Dat'),

('K1202', 'THDC',   1, '20060520', 4.00, 'Khong Dat'),
('K1202', 'THDC',   2, '20060527', 4.00, 'Khong Dat'),

('K1202', 'CTRR',   1, '20060513', 3.00, 'Khong Dat'),
('K1202', 'CTRR',   2, '20060520', 4.00, 'Khong Dat'),
('K1202', 'CTRR',   3, '20060630', 6.25, 'Dat'),


/* ==================== K1203 ==================== */

('K1203', 'CSDL',   1, '20060720',  9.25, 'Dat'),
('K1203', 'CTDLGT', 1, '20061228',  9.50, 'Dat'),
('K1203', 'THDC',   1, '20060520', 10.00, 'Dat'),
('K1203', 'CTRR',   1, '20060513', 10.00, 'Dat'),


/* ==================== K1204 ==================== */

('K1204', 'CSDL',   1, '20060720', 8.50, 'Dat'),
('K1204', 'CTDLGT', 1, '20061228', 6.75, 'Dat'),
('K1204', 'THDC',   1, '20060520', 4.00, 'Khong Dat'),
('K1204', 'CTRR',   1, '20060513', 6.00, 'Dat'),


/* ==================== K1301 ==================== */

('K1301', 'CSDL',   1, '20061220', 4.25, 'Khong Dat'),
('K1301', 'CTDLGT', 1, '20060725', 8.00, 'Dat'),
('K1301', 'THDC',   1, '20060520', 7.75, 'Dat'),
('K1301', 'CTRR',   1, '20060513', 8.00, 'Dat'),


/* ==================== K1302 ==================== */

('K1302', 'CSDL',   1, '20061220', 6.75, 'Dat'),
('K1302', 'CTDLGT', 1, '20060725', 5.00, 'Dat'),
('K1302', 'THDC',   1, '20060520', 8.00, 'Dat'),
('K1302', 'CTRR',   1, '20060513', 8.50, 'Dat'),


/* ==================== K1303 ==================== */

('K1303', 'CSDL',   1, '20061220', 4.00, 'Khong Dat'),

('K1303', 'CTDLGT', 1, '20060725', 4.50, 'Khong Dat'),
('K1303', 'CTDLGT', 2, '20060807', 4.00, 'Khong Dat'),
('K1303', 'CTDLGT', 3, '20060815', 4.25, 'Khong Dat'),

('K1303', 'THDC',   1, '20060520', 4.50, 'Khong Dat'),

('K1303', 'CTRR',   1, '20060513', 3.25, 'Khong Dat'),
('K1303', 'CTRR',   2, '20060520', 5.00, 'Dat'),


/* ==================== K1304 ==================== */

('K1304', 'CSDL',   1, '20061220', 7.75, 'Dat'),
('K1304', 'CTDLGT', 1, '20060725', 9.75, 'Dat'),
('K1304', 'THDC',   1, '20060520', 5.50, 'Dat'),
('K1304', 'CTRR',   1, '20060513', 5.00, 'Dat'),


/* ==================== K1305 ==================== */

('K1305', 'CSDL',   1, '20061220',  9.25, 'Dat'),
('K1305', 'CTDLGT', 1, '20060725', 10.00, 'Dat'),
('K1305', 'THDC',   1, '20060520',  8.00, 'Dat'),
('K1305', 'CTRR',   1, '20060513', 10.00, 'Dat');
GO

/*==============================================================
    CREATE TABLES FIRST
    Constraints are added later in question order.
==============================================================*/

CREATE TABLE KHOA (
    MAKHOA varchar(4) NOT NULL,
    TENKHOA varchar(40),
    NGTLAP smalldatetime,
    TRGKHOA char(4)
);
GO

CREATE TABLE MONHOC (
    MAMH varchar(10) NOT NULL,
    TENMH varchar(40),
    TCLT tinyint,
    TCTH tinyint,
    MAKHOA varchar(4)
);
GO

CREATE TABLE DIEUKIEN (
    MAMH varchar(10) NOT NULL,
    MAMH_TRUOC varchar(10) NOT NULL
);
GO

CREATE TABLE GIAOVIEN (
    MAGV char(4) NOT NULL,
    HOTEN varchar(40),
    HOCVI varchar(10),
    HOCHAM varchar(10),
    GIOITINH varchar(3),
    NGSINH smalldatetime,
    NGVL smalldatetime,
    HESO numeric(4,2),
    MUCLUONG money,
    MAKHOA varchar(4)
);
GO

CREATE TABLE LOP (
    MALOP char(3) NOT NULL,
    TENLOP varchar(40),
    TRGLOP char(5),
    SISO tinyint,
    MAGVCN char(4)
);
GO

CREATE TABLE HOCVIEN (
    MAHV char(5) NOT NULL,
    HO varchar(40),
    TEN varchar(10),
    NGSINH smalldatetime,
    GIOITINH varchar(3),
    NOISINH varchar(40),
    MALOP char(3)
);
GO

CREATE TABLE GIANGDAY (
    MALOP char(3) NOT NULL,
    MAMH varchar(10) NOT NULL,
    MAGV char(4),
    HOCKY tinyint,
    NAM smallint,
    TUNGAY smalldatetime,
    DENNGAY smalldatetime
);
GO

CREATE TABLE KETQUATHI (
    MAHV char(5) NOT NULL,
    MAMH varchar(10) NOT NULL,
    LANTHI tinyint NOT NULL,
    NGTHI smalldatetime,
    DIEM numeric(4,2),
    KQUA varchar(10)
);
GO


/*==============================================================
    CAU 1
    Khai bao tat ca rang buoc KHOA CHINH, KHOA NGOAI
==============================================================*/

-- ======================
-- PRIMARY KEY
-- ======================

ALTER TABLE KHOA
ADD CONSTRAINT PK_KHOA
PRIMARY KEY (MAKHOA);
GO

ALTER TABLE MONHOC
ADD CONSTRAINT PK_MONHOC
PRIMARY KEY (MAMH);
GO

ALTER TABLE DIEUKIEN
ADD CONSTRAINT PK_DIEUKIEN
PRIMARY KEY (MAMH, MAMH_TRUOC);
GO

ALTER TABLE GIAOVIEN
ADD CONSTRAINT PK_GIAOVIEN
PRIMARY KEY (MAGV);
GO

ALTER TABLE LOP
ADD CONSTRAINT PK_LOP
PRIMARY KEY (MALOP);
GO

ALTER TABLE HOCVIEN
ADD CONSTRAINT PK_HOCVIEN
PRIMARY KEY (MAHV);
GO

ALTER TABLE GIANGDAY
ADD CONSTRAINT PK_GIANGDAY
PRIMARY KEY (MALOP, MAMH);
GO

ALTER TABLE KETQUATHI
ADD CONSTRAINT PK_KETQUATHI
PRIMARY KEY (MAHV, MAMH, LANTHI);
GO


-- ======================
-- FOREIGN KEY
-- ======================

-- MONHOC -> KHOA
ALTER TABLE MONHOC
ADD CONSTRAINT FK_MONHOC_KHOA
FOREIGN KEY (MAKHOA)
REFERENCES KHOA(MAKHOA);
GO


-- DIEUKIEN.MAMH -> MONHOC
ALTER TABLE DIEUKIEN
ADD CONSTRAINT FK_DIEUKIEN_MAMH
FOREIGN KEY (MAMH)
REFERENCES MONHOC(MAMH);
GO


-- DIEUKIEN.MAMH_TRUOC -> MONHOC
ALTER TABLE DIEUKIEN
ADD CONSTRAINT FK_DIEUKIEN_MAMH_TRUOC
FOREIGN KEY (MAMH_TRUOC)
REFERENCES MONHOC(MAMH);
GO


-- GIAOVIEN -> KHOA
ALTER TABLE GIAOVIEN
ADD CONSTRAINT FK_GIAOVIEN_KHOA
FOREIGN KEY (MAKHOA)
REFERENCES KHOA(MAKHOA);
GO


-- KHOA.TRGKHOA -> GIAOVIEN
ALTER TABLE KHOA
ADD CONSTRAINT FK_KHOA_TRGKHOA
FOREIGN KEY (TRGKHOA)
REFERENCES GIAOVIEN(MAGV);
GO


-- LOP.MAGVCN -> GIAOVIEN
ALTER TABLE LOP
ADD CONSTRAINT FK_LOP_MAGVCN
FOREIGN KEY (MAGVCN)
REFERENCES GIAOVIEN(MAGV);
GO


-- HOCVIEN -> LOP
ALTER TABLE HOCVIEN
ADD CONSTRAINT FK_HOCVIEN_LOP
FOREIGN KEY (MALOP)
REFERENCES LOP(MALOP);
GO


-- LOP.TRGLOP -> HOCVIEN
ALTER TABLE LOP
ADD CONSTRAINT FK_LOP_TRGLOP
FOREIGN KEY (TRGLOP)
REFERENCES HOCVIEN(MAHV);
GO


-- GIANGDAY -> LOP
ALTER TABLE GIANGDAY
ADD CONSTRAINT FK_GIANGDAY_LOP
FOREIGN KEY (MALOP)
REFERENCES LOP(MALOP);
GO


-- GIANGDAY -> MONHOC
ALTER TABLE GIANGDAY
ADD CONSTRAINT FK_GIANGDAY_MONHOC
FOREIGN KEY (MAMH)
REFERENCES MONHOC(MAMH);
GO


-- GIANGDAY -> GIAOVIEN
ALTER TABLE GIANGDAY
ADD CONSTRAINT FK_GIANGDAY_GIAOVIEN
FOREIGN KEY (MAGV)
REFERENCES GIAOVIEN(MAGV);
GO


-- KETQUATHI -> HOCVIEN
ALTER TABLE KETQUATHI
ADD CONSTRAINT FK_KETQUATHI_HOCVIEN
FOREIGN KEY (MAHV)
REFERENCES HOCVIEN(MAHV);
GO


-- KETQUATHI -> MONHOC
ALTER TABLE KETQUATHI
ADD CONSTRAINT FK_KETQUATHI_MONHOC
FOREIGN KEY (MAMH)
REFERENCES MONHOC(MAMH);
GO



/*==============================================================
    CAU 2
    MAHV:
    - 3 ky tu dau = MALOP
    - 2 ky tu cuoi la so
    Example: K1101
==============================================================*/

ALTER TABLE HOCVIEN
ADD CONSTRAINT CK_HOCVIEN_MAHV
CHECK (
    LEFT(MAHV, 3) = MALOP
    AND RIGHT(MAHV, 2) NOT LIKE '%[^0-9]%'
);
GO



/*==============================================================
    CAU 3
    GIOITINH chi co 'Nam' hoac 'Nu'
==============================================================*/

ALTER TABLE HOCVIEN
ADD CONSTRAINT CK_HOCVIEN_GIOITINH
CHECK (GIOITINH IN ('Nam', 'Nu'));
GO

ALTER TABLE GIAOVIEN
ADD CONSTRAINT CK_GIAOVIEN_GIOITINH
CHECK (GIOITINH IN ('Nam', 'Nu'));
GO



/*==============================================================
    CAU 4
    DIEM tu 1 den 10 va luu 2 so le
    numeric(4,2) da dam bao toi da 2 chu so thap phan
==============================================================*/

ALTER TABLE KETQUATHI
ADD CONSTRAINT CK_KETQUATHI_DIEM
CHECK (DIEM BETWEEN 1 AND 10);
GO



/*==============================================================
    CAU 5
    DIEM >= 5  -> Dat
    DIEM < 5   -> Khong Dat
==============================================================*/

ALTER TABLE KETQUATHI
ADD CONSTRAINT CK_KETQUATHI_KQUA
CHECK (
       (DIEM >= 5 AND KQUA = 'Dat')
    OR (DIEM < 5 AND KQUA = 'Khong Dat')
);
GO



/*==============================================================
    CAU 6
    Hoc vien thi mot mon toi da 3 lan
==============================================================*/

ALTER TABLE KETQUATHI
ADD CONSTRAINT CK_KETQUATHI_LANTHI
CHECK (LANTHI BETWEEN 1 AND 3);
GO



/*==============================================================
    CAU 7
    HOCKY chi co gia tri 1, 2, 3
==============================================================*/

ALTER TABLE GIANGDAY
ADD CONSTRAINT CK_GIANGDAY_HOCKY
CHECK (HOCKY BETWEEN 1 AND 3);
GO



/*==============================================================
    CAU 8
    HOCVI cua giao vien:
    CN, KS, ThS, TS, PTS
==============================================================*/

ALTER TABLE GIAOVIEN
ADD CONSTRAINT CK_GIAOVIEN_HOCVI
CHECK (HOCVI IN ('CN', 'KS', 'ThS', 'TS', 'PTS'));
GO



/*==============================================================
    CAU 9
    Lop truong phai la hoc vien cua lop do
==============================================================*/

CREATE OR ALTER TRIGGER TRG_CAU9_LOPTRUONG
ON LOP
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN HOCVIEN hv
            ON i.TRGLOP = hv.MAHV
        WHERE hv.MALOP <> i.MALOP
    )
    BEGIN
        THROW 50001,
        'Lop truong phai la hoc vien cua lop do.',
        1;
    END
END;
GO


-- Bao ve rang buoc neu MALOP cua hoc vien bi thay doi
CREATE OR ALTER TRIGGER TRG_CAU9_HOCVIEN
ON HOCVIEN
AFTER UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM LOP l
        JOIN inserted i
            ON l.TRGLOP = i.MAHV
        WHERE l.MALOP <> i.MALOP
    )
    BEGIN
        THROW 50002,
        'Khong the chuyen lop vi hoc vien dang la lop truong.',
        1;
    END
END;
GO



/*==============================================================
    CAU 10
    Truong khoa:
    - la giao vien thuoc khoa do
    - hoc vi TS hoac PTS
==============================================================*/

CREATE OR ALTER TRIGGER TRG_CAU10_TRUONGKHOA
ON KHOA
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN GIAOVIEN gv
            ON i.TRGKHOA = gv.MAGV
        WHERE gv.MAKHOA <> i.MAKHOA
           OR gv.HOCVI NOT IN ('TS', 'PTS')
    )
    BEGIN
        THROW 50003,
        'Truong khoa phai thuoc khoa do va co hoc vi TS hoac PTS.',
        1;
    END
END;
GO



/*==============================================================
    CAU 11
    Hoc vien it nhat 18 tuoi
==============================================================*/

CREATE OR ALTER TRIGGER TRG_CAU11_TUOIHOCVIEN
ON HOCVIEN
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted
        WHERE DATEADD(YEAR, 18, NGSINH) > GETDATE()
    )
    BEGIN
        THROW 50004,
        'Hoc vien phai du 18 tuoi.',
        1;
    END
END;
GO



/*==============================================================
    CAU 12
    TUNGAY < DENNGAY
==============================================================*/

ALTER TABLE GIANGDAY
ADD CONSTRAINT CK_GIANGDAY_NGAY
CHECK (TUNGAY < DENNGAY);
GO



/*==============================================================
    CAU 13
    Giao vien khi vao lam it nhat 22 tuoi
==============================================================*/

ALTER TABLE GIAOVIEN
ADD CONSTRAINT CK_GIAOVIEN_TUOIVAOLAM
CHECK (
    NGVL >= DATEADD(YEAR, 22, NGSINH)
);
GO



/*==============================================================
    CAU 14
    TCLT va TCTH chenh lech khong qua 3
==============================================================*/

ALTER TABLE MONHOC
ADD CONSTRAINT CK_MONHOC_TINCHI
CHECK (
    ABS(
        CAST(TCLT AS int)
        -
        CAST(TCTH AS int)
    ) <= 3
);
GO



/*==============================================================
    CAU 15
    Hoc vien chi duoc thi khi lop da hoc xong mon hoc
==============================================================*/

CREATE OR ALTER TRIGGER TRG_CAU15_HOCTRUOCKHITHI
ON KETQUATHI
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted i

        JOIN HOCVIEN hv
            ON i.MAHV = hv.MAHV

        WHERE NOT EXISTS (
            SELECT 1
            FROM GIANGDAY gd
            WHERE gd.MALOP = hv.MALOP
              AND gd.MAMH = i.MAMH
              AND gd.DENNGAY < i.NGTHI
        )
    )
    BEGIN
        THROW 50005,
        'Hoc vien chi duoc thi sau khi lop da hoc xong mon hoc.',
        1;
    END
END;
GO



/*==============================================================
    CAU 16
    Moi hoc ky cua mot nam,
    moi lop hoc toi da 3 mon
==============================================================*/

CREATE OR ALTER TRIGGER TRG_CAU16_TOIDA3MON
ON GIANGDAY
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT
            gd.MALOP,
            gd.HOCKY,
            gd.NAM
        FROM GIANGDAY gd

        JOIN inserted i
            ON gd.MALOP = i.MALOP
           AND gd.HOCKY = i.HOCKY
           AND gd.NAM = i.NAM

        GROUP BY
            gd.MALOP,
            gd.HOCKY,
            gd.NAM

        HAVING COUNT(*) > 3
    )
    BEGIN
        THROW 50006,
        'Moi lop chi duoc hoc toi da 3 mon trong mot hoc ky.',
        1;
    END
END;
GO



/*==============================================================
    CAU 17
    SISO cua lop =
    so luong hoc vien thuoc lop do

    Trigger tu dong cap nhat SISO khi:
    INSERT / DELETE / UPDATE hoc vien
==============================================================*/

CREATE OR ALTER TRIGGER TRG_CAU17_CAPNHAT_SISO
ON HOCVIEN
AFTER INSERT, DELETE, UPDATE
AS
BEGIN
    UPDATE l
    SET SISO = (
        SELECT COUNT(*)
        FROM HOCVIEN hv
        WHERE hv.MALOP = l.MALOP
    )
    FROM LOP l
    WHERE l.MALOP IN (
        SELECT MALOP
        FROM inserted
        WHERE MALOP IS NOT NULL

        UNION

        SELECT MALOP
        FROM deleted
        WHERE MALOP IS NOT NULL
    );
END;
GO



/*==============================================================
    CAU 18
    DIEUKIEN:

    1. Khong duoc co (A, A)
    2. Khong duoc ton tai dong thoi
       (A, B) va (B, A)
==============================================================*/

-- Khong cho (A, A)
ALTER TABLE DIEUKIEN
ADD CONSTRAINT CK_DIEUKIEN_KHACNHAU
CHECK (MAMH <> MAMH_TRUOC);
GO


-- Khong cho (A,B) va (B,A)
CREATE OR ALTER TRIGGER TRG_CAU18_DIEUKIEN
ON DIEUKIEN
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted i

        JOIN DIEUKIEN dk
            ON dk.MAMH = i.MAMH_TRUOC
           AND dk.MAMH_TRUOC = i.MAMH
    )
    BEGIN
        THROW 50007,
        'Khong duoc ton tai dong thoi (A,B) va (B,A).',
        1;
    END
END;
GO



/*==============================================================
    CAU 19
    Giao vien co cung:
    - HOCVI
    - HOCHAM
    - HESO

    thi phai co cung MUCLUONG
==============================================================*/

CREATE OR ALTER TRIGGER TRG_CAU19_MUCLUONG
ON GIAOVIEN
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM GIAOVIEN a

        JOIN GIAOVIEN b
            ON a.MAGV < b.MAGV

           AND (
                a.HOCVI = b.HOCVI
                OR (a.HOCVI IS NULL AND b.HOCVI IS NULL)
           )

           AND (
                a.HOCHAM = b.HOCHAM
                OR (a.HOCHAM IS NULL AND b.HOCHAM IS NULL)
           )

           AND a.HESO = b.HESO

        WHERE
               a.MUCLUONG <> b.MUCLUONG
            OR (a.MUCLUONG IS NULL AND b.MUCLUONG IS NOT NULL)
            OR (a.MUCLUONG IS NOT NULL AND b.MUCLUONG IS NULL)
    )
    BEGIN
        THROW 50008,
        'Giao vien cung hoc vi, hoc ham, he so phai co cung muc luong.',
        1;
    END
END;
GO



/*==============================================================
    CAU 20
    Chi duoc thi lai (LANTHI > 1)
    khi diem lan thi truoc < 5
==============================================================*/

CREATE OR ALTER TRIGGER TRG_CAU20_THILAI
ON KETQUATHI
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted i

        WHERE i.LANTHI > 1

          AND NOT EXISTS (
              SELECT 1
              FROM KETQUATHI k
              WHERE k.MAHV = i.MAHV
                AND k.MAMH = i.MAMH
                AND k.LANTHI = i.LANTHI - 1
                AND k.DIEM < 5
          )
    )
    BEGIN
        THROW 50009,
        'Chi duoc thi lai khi diem lan thi truoc duoi 5.',
        1;
    END
END;
GO



/*==============================================================
    CAU 21
    Ngay thi lan sau >
    ngay thi lan truoc
==============================================================*/

CREATE OR ALTER TRIGGER TRG_CAU21_NGAYTHI
ON KETQUATHI
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted i

        JOIN KETQUATHI truoc
            ON truoc.MAHV = i.MAHV
           AND truoc.MAMH = i.MAMH
           AND truoc.LANTHI = i.LANTHI - 1

        WHERE i.LANTHI > 1
          AND i.NGTHI <= truoc.NGTHI
    )
    BEGIN
        THROW 50010,
        'Ngay thi lan sau phai sau ngay thi lan truoc.',
        1;
    END
END;
GO



/*==============================================================
    CAU 22
    Hoc vien chi duoc thi nhung mon ma lop da hoc xong.

    Cau 22 cung rang buoc voi Cau 15.
    Trigger TRG_CAU15_HOCTRUOCKHITHI da xu ly.
==============================================================*/


/*==============================================================
    CAU 23
    Giao vien chi duoc phan cong day
    nhung mon thuoc khoa giao vien do phu trach
==============================================================*/

CREATE OR ALTER TRIGGER TRG_CAU23_GIANGDAY_KHOA
ON GIANGDAY
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted i

        JOIN GIAOVIEN gv
            ON i.MAGV = gv.MAGV

        JOIN MONHOC mh
            ON i.MAMH = mh.MAMH

        WHERE gv.MAKHOA <> mh.MAKHOA
    )
    BEGIN
        THROW 50011,
        'Giao vien chi duoc day mon thuoc khoa minh phu trach.',
        1;
    END
END;
GO

USE QLGV;
GO

/*==============================================================
    CAU 1
    Tang he so luong them 0.2 cho nhung giao vien la truong khoa
==============================================================*/

UPDATE GIAOVIEN
SET HESO = HESO + 0.2
WHERE MAGV IN (
    SELECT TRGKHOA
    FROM KHOA
    WHERE TRGKHOA IS NOT NULL
);
GO


/*==============================================================
    CAU 2
    Them cot DIEMTB vao HOCVIEN

    DIEMTB = diem trung binh tat ca cac mon hoc.
    Neu mot mon thi nhieu lan -> chi lay diem lan thi CUOI CUNG.
==============================================================*/

ALTER TABLE HOCVIEN
ADD DIEMTB numeric(4,2);
GO


UPDATE HOCVIEN
SET DIEMTB = (
    SELECT AVG(CAST(kq.DIEM AS decimal(5,2)))
    FROM KETQUATHI kq
    WHERE kq.MAHV = HOCVIEN.MAHV

      -- Chi lay lan thi cuoi cung cua moi mon
      AND kq.LANTHI = (
          SELECT MAX(kq2.LANTHI)
          FROM KETQUATHI kq2
          WHERE kq2.MAHV = kq.MAHV
            AND kq2.MAMH = kq.MAMH
      )
);
GO


/*==============================================================
    CAU 3
    Them cot GHICHU vao HOCVIEN

    Neu hoc vien co bat ky mon nao:
        LANTHI = 3
        DIEM < 5

    -> GHICHU = 'Cam thi'
==============================================================*/

ALTER TABLE HOCVIEN
ADD GHICHU varchar(20);
GO


UPDATE HOCVIEN
SET GHICHU = 'Cam thi'
WHERE EXISTS (
    SELECT 1
    FROM KETQUATHI kq
    WHERE kq.MAHV = HOCVIEN.MAHV
      AND kq.LANTHI = 3
      AND kq.DIEM < 5
);
GO


/*==============================================================
    CAU 4
    Them cot XEPLOAI vao HOCVIEN

    DIEMTB >= 9          -> XS
    8   <= DIEMTB < 9   -> G
    6.5 <= DIEMTB < 8   -> K
    5   <= DIEMTB < 6.5 -> TB
    DIEMTB < 5           -> Y
==============================================================*/

ALTER TABLE HOCVIEN
ADD XEPLOAI varchar(10);
GO


UPDATE HOCVIEN
SET XEPLOAI =
    CASE
        WHEN DIEMTB >= 9   THEN 'XS'
        WHEN DIEMTB >= 8   THEN 'G'
        WHEN DIEMTB >= 6.5 THEN 'K'
        WHEN DIEMTB >= 5   THEN 'TB'
        WHEN DIEMTB < 5    THEN 'Y'
        ELSE NULL
    END;
GO


/*==============================================================
    KIEM TRA KET QUA
==============================================================*/

SELECT
    MAHV,
    HO,
    TEN,
    DIEMTB,
    GHICHU,
    XEPLOAI
FROM HOCVIEN;
GO

