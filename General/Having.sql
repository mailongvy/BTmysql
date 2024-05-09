-- cấu trúc của một câu lệnh sql
-- select column_name
-- from table_name
-- where condition
-- group by column_name(s)
-- having condition
-- order by column_names

-- having lọc dữ liệu sau group by
-- hãy cho bik những khách hàng nào đã đặt 20 đơn hàng, sắp xếp theo thứ tự tổng số đơn hàng giảm dân
select o.CustomerID, COUNT(o.OrderID) as "TotalOrder"
from Orders as "o"
group by o.CustomerID
having COUNT(o.OrderID) > 20
order by COUNT(o.OrderID) desc;

-- hãy lọc ra những nhà cung cáp sản phẩm có tổng số lượng hàng trong kho (UnitInStock) lớn hơn 30 và có trung bình đơn giá
-- (UnitPrice) có giá trị dưới 50
select p.SupplierID, SUM(p.UnitsInStock) as "TotalUnitsInStock", AVG(p.UnitPrice) as "AVGunitprice"
from Products as "p"
group by p.SupplierID
having SUM(p.UnitsInStock) > 30 AND AVG(p.UnitPrice) <= 50
order by SUM(p.UnitsInStock) asc;

--hãy cho bik tổng số tiền vận chuyển của từng tháng trong nửa năm sau của 1996, sắp xếp theo tháng tăng dần
-- tổng tiền vận chuyển lón hơn 1000 đô
select MONTH(o.ShippedDate) as "Month", SUM(o.Freight) as "TotalFreight"
from Orders as "o"
where (MONTH(o.OrderDate) BETWEEN '6' AND '12') AND YEAR(o.OrderDate) = '1996' 
group by MONTH(o.ShippedDate)
having SUM(o.Freight) > 1000
order by MONTH(o.ShippedDate) asc;

-- hãy lọc ra những thành phố có số đơn hàng > 16 và sắp xếp chúng theo tổng số lượng giảm dần 
select o.ShipCity, COUNT(o.OrderID) as "Total"
from Orders as "o"
group by o.ShipCity 
having COUNT(o.OrderID) > 16
order by COUNT(o.OrderID) desc;

--1. Hãy cho biết số lượng khách hàng ở mỗi nước, chỉ lấy danh sách ở các nước có nhiều hơn 5 KH và sắp xếp theo thứ tự tăng dần
select c.Country, COUNT(c.CustomerID) as "TotalCustomers"
from Customers as "c"
group by c.Country
having COUNT(c.CustomerID) > 5
order by COUNT(c.CustomerID) asc;