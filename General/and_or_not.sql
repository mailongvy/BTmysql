-- các điều kiện toán tử and or not 
-- các toán tử này dùng trong where(điều kiện)

--Btap
-- bạn hãy liệt kê tất cả các sản phẩm có số lượng trong kho (UnitInStock) thuộc khoảng nhỏ hơn 50 và lớn hơn 100
select *
from Products as "p"
where p.UnitsInStock > 50 AND p.UnitsInStock < 100;

--bạn hãy liệt kê tất cả các đơn hàng được giao đến brazil đã bị giao muộn, biết rằng ngày cần giao hàng là RequiredDate 
--ngày giao hàng thực tế là shippedDate
select *
from Orders as "o"
where o.ShippedDate > o.RequiredDate AND o.ShipCountry = 'Brazil';

--lấy ra các sản phẩm có giá dưới 100 đô và mã thể loại khác 1
select *
from Products as "p"
where p.UnitPrice <= 100 AND NOT(p.CategoryID = 1);

--BTAP1
--hãy liệt kê tất cả các đơn hàng có giá vận chuyển Freight trong khoảng [50, 100] đô la
-- c1 dùng and
select *
from Orders as "o"
where o.Freight >= 50 AND o.Freight <= 100;
-- c2 dùng between
select *
from Orders as "o"
where o.Freight BETWEEN 50 AND 100;


-- hãy liệt các đơn hàng có số lượng hàng trong kho > 20 và số lượng hàng trong kho <20
--c1
select *
from Products as "p"
where p.UnitsInStock <> 20;

--c2 dùng and
select *
from Products as "p"
where p.UnitsInStock > 20 OR p.UnitsInStock < 20;