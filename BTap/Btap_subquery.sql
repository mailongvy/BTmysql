-- liệt kê các đơn hàng có ngày đặt hàng gần nhất
select o.*
from Orders as o
where o.OrderDate = (
	select MAX(OrderDate)
	from Orders
);

-- liệt kê tất cả các sản phẩm (product name)
-- mà ko có đơn đạt hàng nào mua chúng
select *
from Products as p
where p.ProductID NOT IN (
	select distinct ProductID 
	from [Order Details] as od
)

-- lấy thông tin các đơn hàng, và tên các sản phẩm 
-- thuộc các đơn hàng mà ch được giao cho khách
select o.OrderID, p.ProductName
from Orders as o
join [Order Details] as od on o.OrderID = od.OrderID
join Products as p on p.ProductID = od.ProductID
where o.OrderID IN (

		select o.OrderID
		from Orders as o
		where o.ShippedDate IS NULL
)

-- lấy thông tin về các sản phẩm có số lưognj tồn kho 
-- ít hơn số lượng tồn kho trung bình của tất cả sản phẩm
select p.*
from Products as "p"
where p.UnitsInStock < (
	select AVG(p.UnitsInStock)
	from Products as "p"
)

-- lấy thông tin các khách hàng có tổng giá trị đơn hàng lớn nhất
select c.*
from Customers as "c"
join Orders as o on c.CustomerID = o.CustomerID
join [Order Details] as "od" on od.OrderID = o.OrderID
where od.UnitPrice * od.Quantity IN (
	select MAX(od.UnitPrice * od.Quantity)
	from [Order Details] as od
);

