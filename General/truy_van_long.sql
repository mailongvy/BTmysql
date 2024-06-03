-- sub query / nested query :truy vấn con / truy vấn lồng nhau
--subquery (câu truy vấn con ) trong sql là một truy vấn select đươc viết bên trong một truy vấn select update insert hoặc delete khác
--subquery hoạt động như một bảng ảo tạm thời, nó được sử dụng để trích xuất thông tin tù các bảng hoặc tập dữ liệu khác trong cùng  câu truy vấn

-- vd
-- liết kê tất cả các sản phẩm
select *
from Products as "p";

-- tìm giá trị trung bình các sản phẩm
select AVG(p.UnitPrice)
from Products as "p";

-- lọc những sản phẩm có giá > gia trung binh
select p.*
from Products as "p"
where p.UnitPrice >(select AVG(p1.UnitPrice)
					   from Products as p1);

-- loc những khách hàng có số đơn hàng > 10
select c.CustomerID, c.CompanyName, COUNT(o.OrderID) 
from Customers as "c"
left join Orders as "o" on c.CustomerID = o.CustomerID
group by c.CustomerID, c.CompanyName
having COUNT(o.OrderID) > 10;

--subquery loc những khách hang có so đơn hàng > 10
select *
from Customers as c
where c.CustomerID IN (

	select o.CustomerID
	from Orders as "o"
	group by o.CustomerID
	having COUNT(o.OrderID) > 10
);

-- tính tổng tiền của từng đơn hàng
--c1 dùng join
select o.OrderID, SUM(od.Quantity * od.UnitPrice) as "TotalPrice"
from Orders as "o"
join [Order Details] as "od" on o.OrderID = od.OrderID 
group by o.OrderID

--c2: dùng suquery
select o.*, (
				select SUM(od.UnitPrice * od.Quantity)
				from [Order Details] as "od"
				where o.OrderID = od.OrderID
)
from Orders as "o"

-- lọc ra tên sản phẩm và tổng số đơn hàng của sản phẩm

--c1 dùng join
select p.ProductName, COUNT(od.ProductID) as "TotalOrders" 
from Products as p
join [Order Details] as "od" on p.ProductID = od.ProductID
group by p.ProductName;

--c2 dùng subquery
select p.ProductID, p.ProductName, (
					select COUNT(od.ProductID)
					from [Order Details] as "od"
					where p.ProductID = od.ProductID
) as "TotalOrders"
from Products as "p"

-- btap
-- bạn hãy in mã đơn hàng và số lượng sản phẩm của đơn hàng đó
--c1 dùng join
select o.OrderID, COUNT(od.OrderID) 
from Orders as "o"
join [Order Details] as od on o.OrderID = od.OrderID
group by o.OrderID;
--c2 dùng subquery
select o.OrderID, (
		select COUNT(od.OrderID)
		from [Order Details] as od
		where o.OrderID = od.OrderID
)
from Orders as "o"

