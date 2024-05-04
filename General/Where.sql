-- select: column1, column2, ...
-- from: table_name
-- where: condition
--Btap
-- liệt kê tất cả các nhân viên đến từ thành phố london
select *
from Employees as "e"
where e.City = 'London'
order by e.LastName asc, e.FirstName asc;

-- liệt các đơn hàng bị giao muộn biết rằng ngày cần phải giao hàng là requiredDate, ngày giao hàng thực tế là ship date
select count(*) as "Số đơn giao hàng muộn"
from Orders as "o"
where o.RequiredDate < o.ShippedDate;

-- lấy ra những đơn hàng chi tiết được giảm giá nhìu hơn 10%
select * 
from [Order Details] as "OD"
where OD.Discount > 0.1;

-- lấy ra những đơn hàng chi tiết được giảm giá từ 10 đến 20%
select * 
from [Order Details] as "OD"
where OD.Discount between 0.1 and 0.2;

--BTAP 
-- hãy liệt kê các đơn hàng được gửi đến quốc gia là France
select *
from Orders as "o"
where o.ShipCountry = 'France';

-- hãy liệt kê các sản phẩm có số lượng hàng hoá trong kho lớn hơn 20
select *
from Products as "p"
where p.UnitsInStock > 20;

--Hãy liệt kê tất cả các khách hàng không phải ở thành phố Paris
select *
from Employees as "e"
where NOT(e.City = 'Paris');