-- in: có ý nghĩa giống or cho phép kiểm tra nhìu giá trị cung một lúc
-- select: column_name
-- from table_name
-- where column_name in (value1, value2);
-- chỉ cần các column có giá trị trong tập in thì dc lấy ra giá trị

-- btap
-- hãy lọc ra các đơn hàng có điêu kiện:
--a đon hàng được giao đên germany, uk, brazil
--b đon hàng ko được giao đên germany, uk, brazil

--a đơn hàng được giao đến germany, uk, brazil
select *
from Orders as "o"
where o.ShipCountry IN ('Germany', 'UK', 'Brazil');

--b đon hàng ko được giao đên germany, uk, brazil
select *
from Orders as "o"
where o.ShipCountry NOT IN ('Germany', 'UK', 'Brazil');

-- lấy ra các sản phẩm có mã thể loại là khác với 2, 3, 4
select *
from Products as "p"
where p.CategoryID NOT IN (2, 3, 4);

-- ví dụ 3 
-- 1 hãy liệt kê các nhân viên ko phải là nưx từ bảng nhân viên
select *
from Employees as "e"
where e.TitleOfCourtesy NOT IN ('Ms.', 'Mrs.');

-- btap hãy lấy các khách hàng đến từ  những thành phố sau
-- berlin london Warszawa
select *
from Customers as "c"
where c.City IN ('Berlin', 'London', 'Warszawa');

