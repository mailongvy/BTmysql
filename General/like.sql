-- like: lọc dữ liệu chuỗi trong sql
-- select column1, column2
-- from table_name 
-- where column like pattern

-- có hai kí tự đại diện thường được sử dụng cùng vs like
--dấu phần trăm (%) đại diện cho không, một hoặc nhiều kí tự (chuỗi kí tự)
-- dấu gạch dưới (_) đại diện cho một kí tự đơn 

-- hãy lọc tất cả các khách hàng đến từ các quốc gia (Country) bắt đầu bằng chữ A
select *
from Customers as "c"
where c.Country like 'A%';

--lấy danh sách các đơn đặt hàng được gửi đến các thành phố bắt đầu bằng chữ 'a'
select *
from Orders as "o"
where o.ShipCountry like '%a%'

-- hãy lọc ra các đơn hàng với điều kiện 
--shipcountry like 'u_'
--shipcountry like 'u%'

--shipcountry like 'u_'
select *
from Orders as "o"
where o.ShipCountry like 'U_';

-- shipcountry like 'u%'
select *
from Orders as "o"
where o.ShipCountry like 'U%';

-- hãy lấy ra tất cả các nhà cung cấp hàng có chữ 'b' trong tên của các công ty
select *
from Suppliers as "s"
where s.CompanyName like '%b%';