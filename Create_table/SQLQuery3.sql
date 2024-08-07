﻿-- CREATE TABLE table_name
--(
-- [Tên cột] [Kiểu dũ liệu] [khoá chính] [khoá ngoại] [số lượng kí tự] [null] [kiểu tàng buộc]
-- column_name1 column type [other constraints]
-- column_name2 column type [other constraints]
--  ...
--)
CREATE TABLE NhanVien(
	MaNV INT NOT NULL PRIMARY KEY,
	HoTen Varchar(50) NOT NULL,
	Phai VARCHAR(50),
	NgaySinh DATE,
	DiaChi VARCHAR(255),
	SDT VARCHAR(10)
);



-- constraints các lệnh bổ sung khi tạo bảng
-- IDENTITY tạo cột tự tăng
-- IDENTITY(seed, increment) tạo cột tự tăng với giá trị seed và increment
-- DEFAULT thiết lập giá trị mặc định cho cột
-- CHECK thiết lập các ràng buộc kiểm tra cho côt
-- UNIQUE thiết lập ràng buộc duy nhất cho cột

CREATE TABLE KhachHang(
	MaKhachHang Int IDENTITY(100, 5) NOT NULL PRIMARY KEY,
	TenKH VARCHAR(50) NOT NULL,
	Diachi VARCHAR(255),
	SDT VARCHAR(10) check (SDT LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
);

-- cú pháp thay đỏi table
-- ALTER TABLE table_name
-- [thêm(add) | sửa đổi(rename-sửa tên cột | alter column- thay đổi data của cột) | xoá(drop)] [tên cột]
-- [Tên cột] [Kiểu dũ liệu] [khoá chính] [khoá ngoại] [số lượng kí tự] [null] [kiểu tàng buộc]
-- alter table table_name
-- add column_name datatype
-- drop column column_name 
-- rename column old_name to new_name
-- alter( có thể thay đổi thành modify) column column_name datatype

ALTER TABLE NhanVien
ADD Email VARCHAR(100);

ALTER TABLE NhanVien
ALTER column HoTen VARCHAR(100);

ALTER TABLE NhanVien
ADD CONSTRAINT NgaySinh Check (NgaySinh <= GETDATE());

-- xoá dữ liệu của bảng và xoá bảng
-- xoá tất cả dữ liệu của bảng nhưng không xoá bảng
-- dùng TRUNCATE TABLE [tên bảng]
-- xoá bảng hoàn toàn bao gồm cả cấu trúc dữ liệu 
-- drop table [tên bảng]

TRUNCATE TABLE NhanVien;

DROP TABLE NhanVien;

-- tạo bảng sinh vien với cấc cột sau
-- MaSV int, khoá chính khổng thể chứa giá trị NULL
-- HoTen: VARCHAR(50), không thể chứa giá trị null
-- Lop: Varchar(20)
-- Nganh: Varchar(20)
-- DiẻmTB: Float



-- xoá bảng sinh vien 


CREATE TABLE SinhVien (
	MaSV INT NOT NULL PRIMARY KEY,
	HoTen VARCHAR(50) NOT NULL,
	Lop VARCHAR(20),
	Nganh VARCHAR(20),
	DiemTB Float
);

-- thêm cột email vào bảng sinh vien với kiểu dữ liệu VARCHAR(100)
ALTER TABLE SinhVien
ADD Email Varchar(100);

-- sửa đổi kiểu dữ liệu của cột điểmtb trong bảng sinh viên thành kiểu dữ liệu DECIMAL(2, 1)
ALTER TABLE SinhVien
ALTER COLUMN DiemTB DECIMAL(2, 1);

-- Xoa cot nganh  khoi bảng Sinh vien
ALTER TABLE SinhVien
DROP COLUMN Nganh;

-- them ràng buộc kiểm tra cho cột DiemTB trong bảng sinh vien để giá trị >= 0 và <= 10
ALTER TABLE SinhVien
ADD CONSTRAINT DiemTB CHECK (DiemTB >= 0 AND DiemTB <= 10.0);

-- thêm ràng buộc duy nhất cho cột mã MaSV trong bảng sinh vien
ALTER TABLE SinhVien
ADD CONSTRAINT MaSV UNIQUE(MaSV);

-- thêm dữ liệu vào bảng sinh vien với một số thông tin thủ công
-- xoá dũ liệu bảng sinh vien
TRUNCATE TABLE SinhVien;

-- xoá bảng sinh vien 
DROP TABLE SinhVien;

-- tạo lại bảng sinh viên với cấu trúc ban đầu
CREATE TABLE SinhVien (
	MaSV INT NOT NULL PRIMARY KEY,
	HoTen VARCHAR(50) NOT NULL,
	Lop VARCHAR(20),
	Nganh VARCHAR(20),
	DiemTB Float
);

