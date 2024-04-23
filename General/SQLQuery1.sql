-- Viết câu lệnh SQL lấy ra tên của tất cả các sản phẩm
-- select column1, column2 ....
-- from table_name
SELECT[ProductName]

FROM [dbo].[Products];

--viết câu lệnh sql lấy ra tên sản phẩm, giá bán trên mỗi đơn vị, số lượng sản phẩm trên mỗi đon vị
select[ProductName], [UnitPrice], [QuantityPerUnit]
from [dbo].[Products];

--viết câu lệnh sql lấy ra tên công ty của khách hàng và quốc gia của khách hàng đó
select [CompanyName], [Country]
from [dbo].[Customers];

--viết câu lệnh sql lấy ra các tên và số điện thoại của tất cả các nhà cung cấp hàng 
select CompanyName, Phone
from dbo.Suppliers;

-- sử dụng câu lệnh sql chọn ra id tên sđt của các shippers 
select ShipperID, CompanyName, Phone
from dbo.Shippers;

-- ============================================================================================
-- select *: lấy tất cả các cột trong một bảng
-- from table_name

--viết câu lệnh sql lấy ra tất cả dữ liệu từ bảng products
select *
from dbo.Products;

-- viết câu lệnh sql lấy tất cả dữ liệu từ bảng customers
select *
from dbo.Customers;

-- viết các câu lệnh sql lấy tất cả các dữ liệu từ bảng nhà cung cáp - suppliers 
select *
from dbo.Suppliers;

