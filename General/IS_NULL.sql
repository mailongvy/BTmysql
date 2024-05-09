-- is null and is not null: kiểm tra giá trị null (không tồn tại giá trị tại một biến nào đó)
--select column_name
--from table_name
-- where column_name IS NULL/IS NOT NULL

-- btap
-- lấy ra các đơn hàng chưa được giao hàng(shipedate = NULL)
select *
from Orders as "o"
where o.ShippedDate IS NULL;

-- lấy ra các hành khách có khu vực ko bị null
select *
from Customers as "c"
where c.Region IS NOT NULL;

-- lấy ra danh sách khách hàng ko có tên công ty
select *
from Customers as "c"
where c.CompanyName IS NULL;

--btap
--hãy lấy ra tất cả các đơn hàng chưa được giao hàng và khu vực giao hàng ko bị NULL
select *
from Orders as "o"
where o.ShippedDate IS NULL AND o.ShipRegion IS NOT NULL;