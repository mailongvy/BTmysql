-- alias các tên cột
-- select column_name as alias_name
-- from table_name

-- alias các tên bảng
-- select column_name
-- from table_name as alias_name

--viết câu lệnh sql lấy companyname và đặt tên thay thế là công ty
--lấy và đặt tên postalcode là mã bưu điện
select CompanyName as [Tên công ty], 
	   PostalCode as "Mã bưu điện",
	   City as "Thành phố"
from Customers;

-- viết câu lệnh lấy ra lastname và đặt tên là họ
-- lấy ra first name và đặt là tên
select LastName as "họ",
	   FirstName as "tên"
from Employees;

-- viết câu lệnh lấy ra 15 dòng đầu tiên của tất cả các cột trong bảng orders đặt tên thay thế cho bảng là o
select top 15 O.*
from Orders as "O";

-- viết câu lệnh sql lấy ra các cột và đặt tên thay thế như sau
-- productname -> tên sản phẩm
-- Supplierid -> mã nhà cung cấp
-- category -> mã thể loại 
-- và đặt tên cho bảng products là p sử dụng tên thay thế khi truy vấn các cột bên trên 
-- chỉ lấy ra 5 sản phẩm đầu tiên trong bảng

select top 5 p.ProductName as "Tên sản phẩm",
			 p.SupplierID as "Mã nhà cung cấp",
			 p.CategoryID as "Mã thể loại"
from Products as p;

--Viết câu lệnh SQL lấy ra các cột và đặt tên thay thế như sau:
--CompanyName => Tên Công ty
--ContactName => Tên liên hệ
--Address => Địa chỉ
--và đặt rên thay thế cho bảng Suppliers là 's', sử dụng tên thay thế khi truy vấn các cột bên trên 
--và lấy ra 15 sản phẩm đầu tiên trong bảng.
select top 15 s.CompanyName as "Tên công ty",
			  s.ContactName as "Tên liên hệ",
			  s.Address as "Địa chỉ"
from Suppliers as s;
