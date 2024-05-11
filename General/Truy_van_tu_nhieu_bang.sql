--vd1
-- truy vấn từ nhiều bảng
-- từ bảng products và categories, hãy in các thông tín sau đây
-- mã thể loại
-- tên thể loại
-- mã sản phẩm
-- tên sản phẩm
select c.CategoryID, c.CategoryName, p.ProductID, p.ProductName
from Products as "p", Categories as "c"
where c.CategoryID = p.CategoryID;

-- vd2 từ bảng employees và orders hãy in ra các thông tin sau đây
-- mã nhân viên
-- tên nhân viên
-- số lượng đơn hàng mà nhân viên đã bán được
select e.EmployeeID, e.FirstName, e.LastName, COUNT(o.OrderID) "Total"
from Orders as "o", Employees as "e"
where e.EmployeeID = o.EmployeeID
group by e.EmployeeID, e.FirstName, e.LastName
order by COUNT(o.OrderID) desc;

--vd3
-- từ bảng customers và bảng orders hãy in ra các thông tin sau
-- mã số khách hàng
-- tên công ty
-- tên liên hệ
-- số lượng đơn hàng đã mua
-- điều kiện là quốc gia của khách hàng là UK
select c.CustomerID, c.CompanyName, c.ContactName, COUNT(o.OrderID) "TotalOrders"
from Customers as "c", Orders as "o"
where c.CustomerID = o.CustomerID AND c.Country = 'UK'
group by c.CustomerID, c.CompanyName, c.ContactName;


--vd4 
--từ bảng orders và shippers hãy in tất cả các thông tin sau đây
-- mã nhà vận chuyển
-- tên cong ty vận chuyển 
-- tổng só tiền vận chuyển
-- và in ra màn hình theo thứ tự sắp xếp tổng số tiền vận chuyển giảm dần 
select s.ShipperID, s.CompanyName, SUM(o.Freight) as "TotalFreight"
from Orders as "o", Shippers as "s"
where s.ShipperID = o.ShipVia
group by s.ShipperID, s.CompanyName
order by SUM(o.Freight) desc;

--vd5
-- từ bảng products và suppliers hãy in ra các thông tin sau
--mã nhà cung cấp
-- tên công ty
-- tổng số các sản phẩm khác nhau đã cung cấp
-- và chỉ in ra màn hình duy nhất 1 nhà cung cấp có số lượng sản phẩm khác nhau nhìu nhất
select TOP 1 s.SupplierID, s.CompanyName, COUNT(Distinct p.ProductID) "TotalDistictProduct"
from Products as "p", Suppliers as "s"
where p.SupplierID = s.SupplierID
group by s.SupplierID, s.CompanyName
order by COUNT(DISTINCT p.ProductID) desc;

-- vd6
-- từ bảng orders và order details hãy in ra các thông tin sau đây
-- mã đon hàng
-- tổng só tiền sản phẩm của đơn hàng đó
select o.OrderID, SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) "FinalPrice"
from Orders as "o", [Order Details] as "od"
where o.OrderID = od.OrderID
group by o.OrderID
order by SUM(UnitPrice * Quantity * (1 - Discount)) desc;

-- vd 7 
-- từ 3 bảng trong hình hãy in ra các thông tin sau
-- mã đơn hàng
-- tên nhân viên
-- tổng số tiền sản phẩm của đơn hàng
select o.OrderID, e.FirstName, e.LastName, SUM(od.Quantity * od.UnitPrice) as "TotalPrice"
from Orders as "o", [Order Details] as "od", Employees as "e"
where o.OrderID = od.OrderID and o.EmployeeID = e.EmployeeID
group by o.OrderID, e.FirstName, e.LastName;


--btap 
-- từ 3 bảng trong orders customers shippers hãy in ra các thông tin sau đây
-- mã đơn hàng
-- tên khách hàng
-- tên công ty vận chuyển
-- và in ra các đơn hàng được giao đến UK trong năm 1997
select o.OrderID, c.ContactName, s.CompanyName
from Orders as "o", Customers as "c", Shippers as "s"
where c.CustomerID = o.CustomerID and s.ShipperID = o.ShipVia 
	  and o.ShipCountry = 'UK'
	  and YEAR(o.ShippedDate) = 1997;

