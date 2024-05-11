-- các bài tập ôn tập các câu lệnh sql
-- hãy cho biết những khách hàng nào đã đặt nhìu hơn 20 đơn hàng, sắp xếp theo thứ tự tổng số đơn hàng giảm dần

select o.CustomerID, COUNT(o.OrderID) as "TotalOrders"
from Orders as "o"
group by CustomerID
having COUNT(o.OrderID) > 20
order by  COUNT(o.OrderID) desc;

--btao 2
-- hãy lọc ra các nhân viên (employeeID) có tổng số đơn hàng lớn hơn hoặc bằng 100, sắp xếp theo tổng số đơn hàng giảm dần
select o.EmployeeID, COUNT(o.OrderID) as "TotalOrder"
from Orders as "o"
group by o.EmployeeID
having COUNT(o.OrderID) >= 100
order by COUNT(o.OrderID) desc;

--btap 3 
-- hãy cho bik những thể loại nào có số sản phẩm khác nhau lớn hơn 11
select p.CategoryID, COUNT(p.ProductID) as "TotalProduct"
from Products as "p"
group by p.CategoryID
having COUNT(p.ProductID) > 11
order by COUNT(p.ProductID) desc;

-- hãy cho bik những thể loại nào có số tổng số lượng sản phẩm trong kho là 350
select p.CategoryID, SUM(p.UnitsInStock) as "TotalUnitsInStock"
from Products as "p"
group by p.CategoryID
having SUM(p.UnitsInStock) > 350
order by SUM(p.UnitsInStock) desc;

-- hãy cho bik những quốc gia nào trên 7 khách hàng
select o.ShipCountry, COUNT(o.CustomerID) as "TotalCustomers"
from Orders as "o"
group by o.ShipCountry
having COUNT(o.CustomerID) > 7
order by COUNT(o.CustomerID) desc;

-- hãy cho bik những ngày nào có nhiều hơn 5 đơn hàng được giao sắp xếp tăng dần theo ngày giao hàng
select (o.ShippedDate) as "DAY", COUNT(o.OrderID) AS "TotalOrders"
from Orders as "o"
group by (o.ShippedDate)
having COUNT(o.OrderID) > 5
order by (o.ShippedDate);

-- Hãy cho bik những quốc gia bắt đầu bằng chữ A hoặc chữ G 
-- và số lượng đơn hàng lớn ơn 29
select o.ShipCountry, COUNT(o.OrderID) as "TotalOrders"
from Orders as "o"
where o.ShipCountry like '[ag]%'
group by o.ShipCountry
having COUNT(o.OrderID) > 29
order by COUNT (o.OrderID) desc;

-- hãy cho bik những thành phố nào có số lượng đơn hàng được giao là khác 1 và 2,
-- ngày đặt hàng từ 1997-04-01 đến 1997-08-31
select o.ShipCity, COUNT(o.OrderID) as "TotalOrders"
from Orders as "o"
where o.OrderDate Between '1997-04-01' and '1997-08-31'
group by o.ShipCity
having COUNT(o.ShipCity) <> 1 and COUNT(o.ShipCity) <> 2 
order by COUNT(o.OrderID) desc;


