use vidu;

insert into chuong_trinh_dao_tao
values 
('CNTT', 'Cong Nghe Thong Tin', 120, 2022),
('KT', 'Ke Toan', 130, 2022),
('KHMT', 'Khoa Hoc May Tinh', 150, 2020),
('TC', 'Tai chinh', 130, 2020),
('QTKD', 'Quan tri kinh doanh', 120, 2021);


-- gioi tinh 1: nam, 0: nu
insert into nhan_vien
values
(1, 'Nguyen Van', 'Thanh', 'Giang vien', '1990-01-15', 1),
(2, 'Nguyen Thi', 'Van', 'Giang vien', '1995-07-10', 0),
(3, 'Tran Thanh', 'Thien', 'Giang vien', '1970-08-17', 1),
(4, 'Lan Minh', 'Anh', 'Chuyen vien', '1988-03-05', 0),
(5, 'Thai Van', 'Tien', 'Chuyen vien', '1955-01-19', 1);

insert into sinh_vien 
values
('01', 'Le Nhat', 'Thao', '2000-01-05', 2022, 'CNTT', 1),
('02', 'Tran Van', 'An', '2000-07-05', 2022, 'KHMT', 1),
('03', 'Le Thi', 'Thuy', '1999-01-05', 2020, 'QTKD', 0),
('04', 'Hoang My', 'Luu', '1999-01-06', 2020, 'QTKD', 0),
('05', 'Nguyen Hoang', 'Yen', '1999-12-16', 2020, 'CNTT', 0);

insert into monhoc
values
('TRR', 'Toan roi rac', 3, 2020, 'Bat buoc', 'Mon hoc nay cung cap kien thuc ve toan roi rac', null, 'Toan roi rac', 'Sinh vien nam duoc kien thuc toan roi rac', 'Thi viet', 'CNTT'),
('CSKH', 'Cham soc khach hang', 3, 2021, 'Tuy chon', null, null, null, 'Hieu duoc kien tuc', 'Thi Trac Nghiem', 'QTKD');


insert into lophocphan(NamHoc, Hocky, MaMonHoc, MaNhanVien, Ngonngugiangday, Mota, gioihansoluongsinhvien)
values 
(2022, 'Hoc Ky I', 'TRR', 4, 'Tieng Viet', 'Nam chac co ban', 50),
(2022, 'Hoc Ky I', 'CSKH', 1, 'Tieng Anh', 'Nam chac co ban', 80);

insert into thamgiahoc 
values 
(1, '01', null, null),
(1, '02', null, null),
(2, '03', null, null),
(2, '04', null, null),
(2, '05', null, null);





