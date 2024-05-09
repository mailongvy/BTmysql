-- day month year: hàm lấy ngày tháng năm
-- hàm day(date|datetime): hàm lấy ngày
--vd select DAY('2023-08-25') --> 25  lấy dữ liệu ngày
-- tương tự select MONTH(date|datetime): hàm lấy tháng
-- vd select MONTH('2023-08-25') --> 08 lấy dữ liệu tháng
-- tương tự select  YEAR(date|datetime): hàm lấy năm
-- vd select YEAR('2023-08-25') --> 2023 lây dữ liệu năm

-- tính số lượng đơn đặt hàng năm 1997 của từng khách hàng

select o.CustomerID, COUNT(o.OrderID) as "TotalOrders", YEAR(o.OrderDate)
from Orders as "o"
where YEAR(o.OrderDate) = '1997'
group by CustomerID, YEAR(o.OrderDate);

--vd2: hãy lọc ra các đơn hàng được đặt hàng vào tháng 5 năm 1997
select *
from Orders as "o"
where YEAR(o.OrderDate)='1997' and MONTH(o.OrderDate)='5';

--vd lấy ra các danh sách đơn hàng được đặt ngày 4/9/1996
select *
from Orders as "o"
where o.OrderDate = '1996-09-04';

--lấy danh sách khách hàng đặt hàng trong năm 1998 và số đoen hàng mỗi tháng sắp xếp tháng tăng dần
select o.CustomerID, MONTH(o.OrderDate) as "Month", COUNT(*) as "TotalOrders" 
from Orders as "o"
where YEAR(o.OrderDate) = '1998'
group by o.CustomerID, MONTH(o.OrderDate) 
order by MONTH(o.OrderDate) asc;

--btap1
-- hãy lọc các đơn hàng đã được giao vào tháng năm và sắp xếp tăng dần theo năm
select o.OrderID, o.ShippedDate
from Orders as "o"
where MONTH(o.ShippedDate) = '5'
group by o.OrderID, o.ShippedDate
order by YEAR(o.ShippedDate) asc;
