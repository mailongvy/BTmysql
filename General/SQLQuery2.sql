-- viết các câu lệnh lấy các quốc gia (country) khác nhau từ bảng customers
--select distinct lấy các thông tin ko trùng lặp

select distinct Country
from dbo.Customers;

--lấy ra tên các mã số bưu điện (postalcode) khác nhau từ bảng nhà cung cấp suppliers
select distinct PostalCode
from dbo.Suppliers

-- viết các câu lệnh sql lấy ra dữ liệu khác nhau về họ của nhân viên (Lastname) và các danh hiệu lịch sự (titleofcourtesy) của nhân viên từ bảng employees
select distinct LastName, TitleOfCourtesy
from dbo.Employees;

-- viết câu lệnh sql lấy ra mã đơn vị vận chuyển (shipvia) khác nhau của các đơn hàng - orders
select distinct ShipVia
from dbo.Orders;

-- viết câu lệnh sql lấy ra tên công ty và quốc gia khác nhau từ bảng customers 
select distinct CompanyName, Country
from dbo.Customers

-- viết câu lệnh sql lấy ra id (shipper id) khác nhau từ bảng shippers
select distinct ShipperID
from dbo.Shippers