use ban_hang

-- cau 1
create table khach_hang (
    ma_kh char(4) primary key,
    ho_ten varchar(40),
    dia_chi varchar(50),
    so_dt varchar(20),
    ngay_sinh smalldatetime,
    ngay_dk smalldatetime,
    doanh_so money
)

insert into khach_hang (ma_kh, ho_ten, dia_chi, so_dt, ngay_sinh , doanh_so, ngay_dk) values
('KH01', 'Nguyen Van A', '731 Tran Hung Dao, Q5, TpHCM', '08823451', '1960-10-22', 13060000, '2006-07-22'),
('KH02', 'Tran Ngoc Han', '23/5 Nguyen Trai, Q5, TpHCM', '0908256478', '1974-04-03', 280000, '2006-07-30'),
('KH03', 'Tran Ngoc Linh', '45 Nguyen Canh Chan, Q1, TpHCM', '0938776266', '1980-06-12', 3860000, '2006-08-05'),
('KH04', 'Tran Minh Long', '50/34 Le Dai Hanh, Q10, TpHCM', '0917325476', '1965-03-09', 250000, '2006-10-02'),
('KH05', 'Le Nhat Minh', '34 Truong Dinh, Q3, TpHCM', '08246108', '1950-03-10', 21000, '2006-10-28'),
('KH06', 'Le Hoai Thuong', '227 Nguyen Van Cu, Q5, TpHCM', '08631738', '1981-12-31', 915000, '2006-11-24'),
('KH07', 'Nguyen Van Tam', '32/3 Tran Binh Trong, Q5, TpHCM', '0916783565', '1971-04-06', 12500, '2006-12-01'),
('KH08', 'Phan Thi Thanh', '45/2 An Duong Vuong, Q5, TpHCM', '0938435756', '1971-01-10', 365000, '2006-12-13'),
('KH09', 'Le Ha Vinh', '873 Le Hong Phong, Q5, TpHCM', '08654763', '1979-09-03', 70000, '2007-01-14'),
('KH10', 'Ha Duy Lap', '34/34B Nguyen Trai, Q1, TpHCM', '08768904', '1983-05-02', 67500, '2007-01-16');

create table nhan_vien (
    ma_nv char(4) primary key,
    ho_ten varchar(40),
    so_dt varchar(20),
    ngay_vao_lam smalldatetime
);

insert into nhan_vien (ma_nv, ho_ten, so_dt, ngay_vao_lam) values
('NV01', N'Nguyen Nhu Nhut', '0927345678', '2006-04-13'),
('NV02', N'Le Thi Phi Yen', '0987567390', '2006-04-21'),
('NV03', N'Nguyen Van B', '0997047382', '2006-04-27'),
('NV04', N'Ngo Thanh Tuan', '0913758498', '2006-06-24'),
('NV05', N'Nguyen Thi Truc Thanh', '0918590387', '2006-07-20');

create table san_pham (
    ma_sp char(4) primary key,
    ten_sp varchar(40),
    don_vi_tinh varchar(20),
    nuoc_sx varchar(40),
    gia money
);

create table hoa_don (
    so_hd int primary key,
    ngay_mua smalldatetime,
    ma_kh char(4) references khach_hang(ma_kh),
    ma_nv char(4) references nhan_vien(ma_nv),
    tri_gia money
);

create table cthd (
    primary key (so_hd, ma_sp),
    so_hd int references hoa_don(so_hd),
    ma_sp char(4) references san_pham(ma_sp),
    sl int,
);

-- cau 2
alter table san_pham
add ghi_chu varchar(20);

-- cau 3
alter table khach_hang
add loai_kh tinyint;

-- cau 4
alter table san_pham
alter column ghi_chu varchar(100);

-- cau 5
alter table san_pham
drop column ghi_chu;

-- cau 6
alter table khach_hang
alter column loai_kh varchar(20);

alter table khach_hang
add check (loai_kh in ('Vang lai', 'Thuong xuyen', 'Vip'));

-- cau 7
alter table san_pham
add check (don_vi_tinh in ('cay', 'hop', 'cai', 'quyen', 'chuc'));

-- cau 8
alter table san_pham
add check (gia >= 500);

-- cau 9
alter table san_pham
add check (don_vi_tinh >= 1)

-- cau 10
alter table khach_hang
add check (ngay_dk > ngay_sinh);

-- cau 11

-- cach 1 (tao function)
create or alter function dbo.fn_ngay_mua (
    @ma_kh char(4),
    @ngay_mua smalldatetime
)
returns bit
as begin
    declare @ngay_sinh smalldatetime
    set @ngay_sinh = (
        select ngay_sinh
        from khach_hang
        where ma_kh = @ma_kh
    );
    if @ngay_mua > @ngay_sinh
        return 1;
    return 0;
end;
go
alter table hoa_don
add check(dbo.fn_ngay_mua(ma_kh, ngay_mua)=1);

-- cach 2 (dung trigger)
create or alter trigger trg_check_ngay_mua
on hoa_don
after insert, update
as begin
    if exists (
        select *
        from inserted i
        join khach_hang kh
        on i.ma_kh = kh.ma_kh
        where i.ngay_mua <= kh.ngay_sinh
    ) begin
        raiserror(N'ngay mua hang phai lon hon ngay sinh', 16, 1);
        rollback transaction;
    end
end;

-- cau 12
create or alter trigger trg_check_ngay_ban
on hoa_don
after insert, update
as begin
    if exists (
        select 1
        from inserted i
        join nhan_vien nv
        on i.ma_nv = nv.ma_nv
        where i.ngay_mua < nv.ngay_vao_lam
    ) begin
        raiserror('ngay ban hang cua nhan vien phai lon hon ngay vao lam cua ho', 16, 1);
        rollback transaction;
    end
end;

-- cau 13
create or alter trigger trg_check_cthd
on hoa_don
after insert, update
as begin
    if exists (
       select 1
       from inserted i
       where not exists (
            select 1
            from cthd ct
            where i.so_hd = ct.so_hd
        )
    ) begin
        raiserror('hoa don phai co it nhat mot chi tiet hoa don', 16, 1);
        rollback transaction;
    end
end;


-- cau 14
create or alter trigger trg_check_tri_gia
on hoa_don
after insert, update
as
begin
    if exists (
        select 1
        from inserted i
        where i.tri_gia <> (
            select sum(ct.sl * sp.gia)
            from cthd ct
            join san_pham sp
            on ct.ma_sp = sp.ma_sp
            where ct.so_hd = i.so_hd
        )
    )
    begin
            raiserror('tri gia hoa don phai bang tong tri gia cac san pham trong chi tiet hoa don', 16, 1);
            rollback transaction;
    end
end

-- cau 15
create or alter trigger trg_check_doanh_so
on khach_hang
after insert, update
as
begin
    if exists (
        select 1
        from inserted i
        where i.doanh_so <> (
            select sum(hd.tri_gia)
            from hoa_don hd
            where hd.ma_kh = i.ma_kh
        )
    ) begin
        raiserror('doanh so cua khach hang phai bang tong tri gia cac hoa don cua khach hang do', 16, 1);
        rollback transaction;
    end
end



