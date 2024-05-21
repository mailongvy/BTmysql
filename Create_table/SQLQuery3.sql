-- CREATE TABLE table_name
--(
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
-- IDENTIFY tạo cột tự tăng
-- IDENTIFY(seed, increment) tạo cột tự tăng với giá trị seed và increment
-- DEFAULT thiết lập giá trị mặc định cho cột
-- CHECK thiết lập các ràng buộc kiểm tra cho côt
-- UNIQUE thiết lập ràng buộc duy nhất cho cột
	