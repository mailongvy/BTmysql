--select top number|percent column_names 
--from table_name
--where condition
-- đây là câu lệnh sql giới hạn số lượng dòng trả về bằng 1 số hay số phần trăm để lấy ra thông tin dữ liệu 
-- vd lấy ra 5 dòng đầu tiên của bảng customers
select top 10 *
from dbo.Customers;

-- viết câu lệnh sql lấy ra 30% nhân viên của công ty hiện tại 
select top 100 percent *
from Employees;

-- viết câu lệnh sql lấy ra các đơn hàng với quy định là mã khách hàng không được trùng lặp chỉ lấy 5 dòng dữ liệu đầu tiên
select distinct top 5 CustomerID 
from Orders;

-- viết các câu lệnh sql lấy ra sản phảm có mã thể loại không bị trùng lặp và chỉ lấy 3 dòng đầu tiên
select distinct top 3 CategoryID 
from Products;

-- truy vấn ko trùng lặp shipname shipaddress trong bảng order
select distinct top 20 percent ShipName, ShipAddress 
from Orders;

-- truy vấn 20 dòng đầu của bảng orders 
select distinct top 20 *
from Orders;