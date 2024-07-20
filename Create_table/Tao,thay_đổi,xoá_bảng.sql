-- CREATE TABLE table_name
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
add Email varchar(100);



CREATE TABLE Sinhvien(
	MaSV INT NOT NULL PRIMARY KEY,
	HoTen VARCHAR(50) NOT NULL,
	Lop VARCHAR(20),
	Nganh VARCHAR(20),
	DiemTB FLOAT
	);

-- BT2: Các yêu cầu sau:
-- 2: Thêm cột Email vào bảng SinhVien với kiểu dữ liệu VARCHAR(100).
ALTER TABLE dbo.Sinhvien
ADD Email VARCHAR(100);

-- 3: Sửa đổi kiểu dữ liệu của cột DiemTB trong bảng SinhVien thành kiểu dữ liệu DECIMAL(2,1).
ALTER TABLE dbo.Sinhvien
ALTER COLUMN DiemTB DECIMAL(2,1);

-- 4: Xóa cột Nganh khỏi bảng SinhVien.
ALTER TABLE dbo.Sinhvien
DROP COLUMN Nganh;

-- 5: Thêm ràng buộc kiểm tra cho cột DiemTB trong bảng SinhVien để giá trị phải lớn hơn hoặc bằng 0.
ALTER TABLE dbo.Sinhvien
ADD CONSTRAINT DiemTBCheck CHECK (DiemTB >= 0 AND DiemTB <= 10);

-- 6: Thêm ràng buộc duy nhất cho cột MaSV trong bảng SinhVien.
ALTER TABLE dbo.Sinhvien
ADD CONSTRAINT MaSVUnique UNIQUE(MaSV);

-- 7: Thêm dữ liệu vào bảng SinhVien với một số thông tin thủ công.

-- 8: Xóa dữ liệu trong bảng SinhVien.
TRUNCATE TABLE dbo.Sinhvien;

-- 9: Xóa bảng SinhVien.
DROP TABLE dbo.Sinhvien;

-- 10: Tạo lại bảng SinhVien với cấu trúc ban đầu.
CREATE TABLE Sinhvien(
	MaSV INT NOT NULL PRIMARY KEY,
	HoTen VARCHAR(50) NOT NULL,
	Lop VARCHAR(20),
	Nganh VARCHAR(20),
	DiemTB FLOAT
	);


