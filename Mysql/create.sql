use vidu;

Create table Chuong_trinh_dao_tao (
	MaChuongTrinhDaoTao varchar(50) not null,
    TenChuongTrinhDaoTao varchar(255),
    SoTinChi float,
    NamBatDauDaoTao year,
    PRIMARY KEY (MaChuongTrinhDaoTao)
);

create table Nhan_vien(
	MaNhanVien int not null auto_increment,
    hodem varchar(50),
    ten varchar(50),
    theloai varchar(50),
    ngaysinh date,
    primary key (MaNhanVien)
);

alter table nhan_vien
add gioitinh tinyint;

alter table nhan_vien
add constraint gioitinh check (gioitinh in (0, 1));

create table sinh_vien(
	MaSinhVien varchar(50) not null,
    HoDem varchar(50),
    Ten varchar(50),
    Ngaysinh date,
    NamNhapHoc year,
    MaChuongTrinhDaoTao varchar(50) not null,
    primary key (MaSinhVien),
    constraint FK_MaChuongTrinhDaoTao foreign key (MaChuongTrinhDaoTao)
	references Chuong_trinh_dao_tao(MaChuongTrinhDaoTao)
);

alter table sinh_vien
add gioitinh tinyint;

alter table sinh_vien
add constraint gioitinh check (gioitinh in (0, 1));

create table MonHoc (
	MaMonHoc varchar(50) not null,
    Tenmonhoc varchar(255),
    Sotinchi float,
    NamBatDauApDung year,
    theloai varchar(50),
    motaTomtat varchar(1024),
    motaDayDu Text,
    tailieu varchar(1024),
    muctieudaura varchar(1024),
    hinhthucdanhgia varchar(1024),
    MaChuongTrinhDaoTao varchar(50) not null,
    primary key (MaMonHoc),
    constraint FK1_MaChuongTrinhDaoTao foreign key (MaChuongTrinhDaoTao)
	references Chuong_trinh_dao_tao(MaChuongTrinhDaoTao)
);

create table LopHocPhan (
	MaLopHocPhan int not null auto_increment,
    NamHoc year,
    Hocky varchar(50),
    MaMonHoc varchar(50) not null,
    MaNhanVien int not null,
    Ngonngugiangday varchar(50) not null,
    Mota text not null,
    gioihansoluongsinhvien int not null,
    primary key (MaLopHocPhan),
    constraint FK_MAMONHOC foreign key (MaMonHoc) references monhoc(MaMonHoc),
    constraint FK_MAGIANGVIEN foreign key (MaNhanVien) references nhan_vien(MaNhanVien)
);

create table thamgiahoc (
	MaLopHocPhan int not null,
    MaSinhVien varchar(50) not null,
    diemso float,
    diemchu varchar(2),
    constraint FK_MALOPHOCPHAN foreign key (MaLopHocPhan) references lophocphan(MaLopHocPhan),
    constraint FK_MASINHVIEN foreign key (MaSinhVien) references sinh_vien(MaSinhVien)
);

alter table thamgiahoc
add constraint primary key(MaLopHocPhan, MaSinhVien);






