-- union / union all: kết hợp các kết quả
-- từ bagr orders details hãy liệt kê các đơn hàng có unit price nằm trong phạm vi từ 100 đến 200
select *
from [Order Details] as "od"
where od.UnitPrice between 100 and 200;

-- đưa ra các đơn hàng có quantity = 10 hoặc 20
select *
from [Order Details] as "od"
where od.Quantity = 10 or od.Quantity = 20;

-- truy vấn 3
-- từ cái bảng order details hãy liệt kê các đơn hàng có unit price nằm trong phạm vi 100 đến 200 và đơn hàng phải có 
-- quantity bằng 10 hoặc 20
select *
from [Order Details] as "od"
where (od.Quantity IN (10, 20)) AND (od.UnitPrice between 100 and 200);

-- truy vấn 4
-- từ cái bảng order details hãy liệt kê các đơn hàng có unit price nằm trong phạm vi 100 đến 200 hoặc đơn hàng phải có 
-- quantity bằng 10 hoặc 20
select *
from [Order Details] as "od"
where (od.Quantity IN (10, 20)) OR (od.UnitPrice between 100 and 200);

-- truy vấn 5
-- từ bẳng orderdetails hãy liệt kê ra các đơn hàng có unitprice nằm trong phạm vi từ 100 đến 200 
-- hoặc đơn hàng phải có quantity bằng 10 hoặc 20 có sử dụng distinct
select distinct OrderID
from [Order Details] as "od"
where (od.Quantity IN (10, 20)) OR (od.UnitPrice between 100 and 200);


--select column_name from table1
--union
--select column_name from table2
-- union: được sử dụng để kết hợp các kết quả của hai hoặc nhiều câu lệnh 
-- mỗi câu lệnh phải có cùng số lượng cột
-- các cột phải có kiểu dũ liệu tương tự nhau
-- các cột của mỗi câu lệnh cũng phải theo cung thứ tự
-- tương tự vs union all nhưng union all cho phép các giá trị bị lặp lại (=====)

-- thực hện lại truy vấn số 5, sử dụng union
-- 360 rows do ko tính các phần tử đc lặp lại
select od.OrderID
from [Order Details] as "od"
where od.UnitPrice between 100 and 200
union
select od.OrderID
from [Order Details] as "od"
where od.Quantity = 10 or od.Quantity = 20;

-- thực hiện lại truy vấn số 4 sử dụng union (ko distinct)
select od.OrderID
from [Order Details] as "od"
where od.UnitPrice between 100 and 200
union all
select od.OrderID
from [Order Details] as "od"
where od.Quantity = 10 or od.Quantity = 20;

-- vd3 
-- hãy liệt kê toàn bộ thành phố và quốc gia tồn tại trong 2 tables customers and suppliers trong hai tình huống dùng 
-- union and union all
select c.Country
from Customers as "c"
union 
select s.Country
from Suppliers as "s";

-- lấy tất các thành phố và quốc gia sao cho
--1: các khách hàng tới từ các quốc gia bắt đầu bằng chữ U
--2: các nhà cung cấp có có thành phố là london
--3: các đơn hàng dc ship đén usa
select c.City, c.Country
from Customers as "c"
where c.Country like 'U%'
union
select s.City, s.Country
from Suppliers as "s"
where s.City = 'London'
union
select o.ShipCity, o.ShipCountry
from Orders as "o"
where o.ShipCountry = 'USA';
