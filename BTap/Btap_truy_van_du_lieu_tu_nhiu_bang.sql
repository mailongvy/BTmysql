-- btap truy vấn dữ liệu từ nhiều bảng
-- từ bảng products and categories, hãy tìm các sản phẩm thuộc danh mục seafood (Đồ hải sản) và in ra các thông tin sau đây
-- mã thể loại
-- tên thể loại
-- mã sản phẩm
-- tên sản phẩm
select c.CategoryID, c.CategoryName, p.ProductID, p.ProductName
from Products as "p", Categories as "c"
where p.CategoryID = c.CategoryID and c.CategoryName = 'Seafood'

-- btap 2
-- từ bảng products và suppliers, hãy tìm ra những sản phẩm được cung cấp từ nước đức
-- mã nhà cung cấp
-- quốc gia
-- mã sản phẩm 
-- tên sản phẩm
select s.SupplierID, s.Country, p.ProductID, p.ProductName
from Products as "p", Suppliers as "s"
where p.SupplierID = s.SupplierID and
	  s.Country = 'Germany';

-- btap 3
--từ 3 bảng orders customers shippers hãy in các thông tin sau đây
-- mã đơn hàng
-- tên khách hàng
-- tên công ty vần chuyển
-- và chỉ ra các đơn hàng của các khách hàng tới từ london
select o.OrderID, c.ContactName, s.CompanyName
from Orders as "o", Customers as "c", Shippers as "s"
where  o.CustomerID = c.CustomerID and	o.ShipVia = s.ShipperID
	   and c.City = 'London';

-- btap 4
-- từ 3 bảng orders customers shippers hãy in các thông tin sau đây
-- mã đơn hàng 
-- tên khách hàng
-- tên công ty vận chuyển ngày yêu cầu chuyển hàng
-- ngày giao hàng
-- và chỉ in ra các đơn hàng bị muộn hơn quy định
select o.OrderID, c.ContactName, s.CompanyName, o.RequiredDate, o.ShippedDate, o.OrderDate
from Orders as "o", Customers as "c", Shippers as "s"
where  o.CustomerID = c.CustomerID and	o.ShipVia = s.ShipperID
	   and o.RequiredDate < o.ShippedDate;

-- btap
-- given these shipcountries for which customers don't come form US
-- select only this countries which is over than 100 orders 
-- display shipcountry and number of orders 
select o.ShipCountry, COUNT(o.OrderID) "TotalOrder"
from Orders as "o", Customers as "c"
where o.CustomerID = c.CustomerID
	  and o.ShipCountry <> 'USA'
group by o.ShipCountry
having COUNT(o.OrderID) > 100;