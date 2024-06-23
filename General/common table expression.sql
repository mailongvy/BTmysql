-- common table expression (cte): được sử dụng để tạo các bảng tạm thời và sử dụng nó trong các truy vấn sau đó
-- giúp làm cho câu truy vấn trở nên dễ đọc và dễ quản lí hơn 
-- with tên_cte (cột 1, cột 2, .... ) as (
-- truy van de dinh nghia cte
-- )

select *
from Products;

select * 
from [Order Details];

with short_e as (
	select e.EmployeeID, e.LastName, e.FirstName
	from Employees as e
)

select *
from short_e;

-- lấy thông tin về các sản phẩm products có cùng thể loại với một sản phẩm cụ thể
--c1 dùng truy vấn lồng
select p.ProductID, p.ProductName
from Products as p
where p.CategoryID = (
	select p1.CategoryID
	from Products as p1
	where p1.ProductName = 'Chai'
)
except (
	select p2.ProductID, p2.ProductName
	from Products as p2
	where p2.ProductName = 'Chai'
);
--c2 dùng join
select p.CategoryID, p.ProductName
from Products as p
join (
	select p1.CategoryID
	from Products as p1
	where p1.ProductName = 'Chai'
) as sq
on p.CategoryID = sq.CategoryID;

-- c3 dùng cte
with ProductCategories as (
	select p1.CategoryID
	from Products as p1
	where p1.ProductName = 'Chai'
)

select p.CategoryID, p.ProductName
from Products as p
join ProductCategories as sq
on p.CategoryID = sq.CategoryID;

-- lấy thông tin về đơn hàng orders cùng với tổng giá trị đơn hàng và tỷ lệ giưuax tổng giá trị và phí giao hàng
select o.OrderID, o.OrderDate, o.Freight, (
	select SUM(od.UnitPrice * od.Quantity)
	from [Order Details] as od
	where od.OrderID = o.OrderID
) as TotalPrice,
	(
	select SUM(od.UnitPrice * od.Quantity)
	from [Order Details] as od
	where od.OrderID = o.OrderID
	) / o.Freight as ratio 
	
from Orders as o;


-- ----------------------------------------
with OrderTotals as (
	select od.OrderID, SUM(od.Quantity * od.UnitPrice) as TotalPrice
	from [Order Details] as od
	group by od.OrderID
)

select o.OrderID, o.OrderDate, o.Freight, ot.TotalPrice, (ot.TotalPrice / o.Freight ) as ratio
from Orders as o
join OrderTotals as ot on ot.OrderID = o.OrderID





--sử dụng cte để tính tổng doanh số bán hàng cho từng sản phẩm từ hai bảng order details và products trong northwind
with PerProducts as (
	 select od.ProductID, SUM(od.Quantity * od.UnitPrice) as TotalPrice
	 from [Order Details] as od
	 group by od.ProductID
)
select p.ProductName, pp.TotalPrice
from Products as p
join PerProducts as pp on p.ProductID = pp.ProductID;

--sử dụng cte để tính toán tổng doanh số bán hàng theo từng khách hàng và sau đó sắp xếp danh sách khách hàng theo tổng doanh số giảm dần
with TotalSales as (
	select o.CustomerID, SUM(od.Quantity * od.UnitPrice) as "TotalPrice"
	from [Order Details] as od
	join Orders as o on o.OrderID = od.OrderID
	group by o.CustomerID
)
select c.CustomerID, ts.TotalPrice
from Customers as c
join TotalSales as ts on c.CustomerID = ts.CustomerID;

--sử dụng cte tính tổng doanh số bán hàng theo từng năm từ bảng orders và order details

with TotalSales as (
	select od.OrderID, sum(od.Quantity * od.UnitPrice) as "TotalPrice"
	from [Order Details] od
	group by od.OrderID
	)
select year(o.OrderDate) as "Year",
	   sum(ts.TotalPrice) as "TotalSalesPerYear"
from Orders o
join TotalSales ts on o.OrderID = ts.OrderID
group by year(o.OrderDate)
order by year(o.OrderDate) asc;