-- btap 1: inner join
-- liệt kê tên sản phẩm và tên các nhà cung cấp của các sản phẩm đã được đặt hàng trong bảng order details 
-- sử dụng inner join để kết hợp bảng order details và các bảng liên quan để lấy thông tin sản phẩm và các nhà cung cấp
select distinct od.ProductID, p.ProductName, s.CompanyName
from [Order Details] as "od"
join Products as "p" on od.ProductID = p.ProductID
join Suppliers as "s" on s.SupplierID = p.SupplierID;

--btap2: left join
-- liệt kê tên khách hàng và tên nhân viên phụ trách của các đơn hàng trong bảng orders. bao gồm tất cả các đơn hàng ko có nhân viên phụ trách
-- sử dụng left join để kết hợp bảng orders vs bảng employees để lấy thông tin khách hàng và nhân viên phụ trách
select o.OrderID, c.ContactName, e.FirstName, e.LastName
from Orders as "o"
left join Customers as "c" on o.CustomerID = c.CustomerID
left join Employees as "e" on o.EmployeeID = e.EmployeeID

-- btap3: right join
-- liệt kê tên khách hàng và tên nhân viên phụ trách của các đơn hàng trong bảng orders. bao gồm cả khách hàng không có đơn hàng 
-- sử dụng right join để kêt hợp bảng orders vs bảng customers để lấy thông tin về khách hàng và nhân viên phụ trách
select c.ContactName, o.OrderID, e.FirstName, e.LastName
from Orders as "o"
right join Employees as "e" on o.EmployeeID = e.EmployeeID
right join Customers as "c" on o.CustomerID = c.CustomerID

-- full join
-- liệt kê tên các danh mục và tên nhà cung cấp của các sản phẩm trong bảng products. bao gồm tất cả các danh mục và nhà cung cấp 
-- ko có sẩn phẩm 
-- sử dụng full join hoặc kết hợp right join and left join để lấy thôgn tin về danh mục và các nhà cung cấp
select p.ProductID, p.ProductName, c.CategoryName, s.CompanyName
from Products as "p"
full join Categories as "c" on p.CategoryID = c.CategoryID
full join Suppliers as "s" on p.SupplierID = s.SupplierID;

--btap5:
-- inner join
-- liệt kê tên khách hàng và tên sản phẩm đã được đặt hàng trong bảng orders và orders details 
select c.ContactName, p.ProductName
from Orders as "o"
join [Order Details] as "od" on o.OrderID = od.OrderID
join Products as "p" on od.ProductID = p.ProductID
join Customers as "c" on o.CustomerID = c.CustomerID
