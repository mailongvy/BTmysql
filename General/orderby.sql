--order by: săp xếp kết quả trả về của truy vấn 
--ví dụ là sắp xếp lãi xuất các ngân hàng trong thời kì 7 tháng
--select: column 1, column 2
-- from: table_name
--order by: column1, column2, ... ASC|DESC
-- asc là sắp xếp theo kiểu tăng dần(mặc định)
-- desc là sắp xếp theo kiểu giảm dần

-- BT1: hãy liệt kê tất cả các nhà cung cấp theo thứ tự tên đơn vị company name
select s.CompanyName as "Tên các nhà cung cấp "
from Suppliers as "s"
order by s.CompanyName asc; --ascending

--liệt kê tất cả các sản phẩm theo thứ tự giá giảm dần
select *
from Products as "p"
order by p.UnitPrice desc; --descending

-- hãy liệt kê tất cả nhân viên theo thứ tự họ và tên đệm theo thứ tự từ a-z
select *
from Employees as e
order by e.LastName, e.FirstName;

--hãy lấy ra một sản phẩm có số lượng bán cao nhất từ bảng order details
--test
select *
from [Order Details] as "OD"
order by OD.Quantity desc;
-- c1 sử dụng max
select MAX(OD.Quantity) as "Số lượng bán cao nhất"
from [Order Details] as "OD";
-- c2 ko sử dụng max
select top 1 *
from [Order Details] as "OD"
order by OD.Quantity desc;

-- BTAP 1
--hãy liệt kê danh sách các đơn đặt hàng (orderID) trong bảng order theo thứ tự giảm dần của ngày đặt hàng (orderdate)
select o.OrderID as "Các đơn đặt hàng", o.OrderDate as "Ngày đặt hàng"
from Orders as "o"
order by o.OrderDate desc;

--BTAP 2
--hãy liệt kê tên, đơn giá, số lượng, tồn kho (Unitsinstock) của tất cả các sản phẩm trong bảng products theo thứ tự giảm dần của
-- Unitsinstock
select p.ProductName as "Tên hàng", p.UnitPrice as "Đơn giá", p.UnitsInStock as "Hàng tồn kho"
from Products as p
order by p.UnitsInStock desc;

-- Thử thách: 
-- 1. Liệt kê nhân viên có địa chỉ tăng dần từ a đến z từ bảng nhân viên employees
select *
from Employees as "e"
order by e.Address asc;

-- 2
-- Lấy ra 1 đơn hàng có ngày giao trễ nhất.
-- Không dùng max
select top 1 *
from Orders as "o"
order by o.OrderDate desc;

-- 3.
-- Liệt ra 20 nhà cung cấp có thành phố và vùng từ z - a
-- từ bảng Suppliers;
select top 20 *
from Suppliers as "s"
order by s.City desc, s.Region desc;