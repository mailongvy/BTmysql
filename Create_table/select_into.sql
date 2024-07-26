-- câu lệnh select into trog sql được sử dụng đêt ạo bảng mới cà sao chép dũ liệu từ 1 bảng hiệnc có sang 1 bảng mới
-- nó thường được sử dụng để tạo bảng tạm thời hoặc sao lưu dữ liệu từ một bảng hiện có để thực hiện các phân tích và thao tác dữ liệu khác
-- câu lệnh SELECT INTO cx có thể được sử dụng để chọn một phần dũ liệu từ 1 phần dữ liệu từ bảng nguòn cà chèn nó vào bảng mới

-- cú pháp
-- select *
-- into newtable [IN externaldb]
-- from oldtable
-- where condition

-- cú pháp 2
-- select column1, column2, column3 ...
-- into newtable [IN externaldb]
-- from oldtable
-- where condition

-- taọ ra bảng mới với các sản phẩm lớn hơn 50
Select *
Into HighValueProduct
from Products as p
where p.UnitPrice > 50

select *
from HighValueProduct as hvp;

-- tạo ra bảng mới với các đơn hàng được giao đến USA 
Select *
Into USAorders
from Orders as o
where o.ShipCountry LIKE 'USA';

select * 
from USAorders as USAO;

select *
from Customers
order by City

-- tạo một bảng tạm thời customersinlondon tưqf bảng customers trong cơ sở dũ liệu northwind để chứa thông tin khách hàng có địa chỉ ở london
select *
into CustomersInLondon
from Customers as c
where c.City like 'London';

select *
from CustomersInLondon;

-- tạo một bảng tạm thời HighValueOrders để chứa các thông tin về các đơn hàng có giá trị đơn đặt hàng hơn 1000 đo la
with TotalPriceOrder as (
	select od.OrderID, SUM(od.UnitPrice * od.Quantity) as TotalPrice
	from [Order Details] as od
	group by od.OrderID
)
select o.*, tpo.TotalPrice 
into HighValueOrders 
from Orders as o
inner join TotalPriceOrder as tpo on tpo.OrderID = o.OrderID
where tpo.TotalPrice > 1000;

select *
from HighValueOrders;
