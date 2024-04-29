-- các hàm count sum avg

--count: đếm số lượng bản ghi khác null
-- select Count(column_name)
-- from table_name

-- sum: tính tổng giá trị của một cột nếu bất kì giá trị trong cột là null thì kết quả cảu hàm là null
--select Sum(column_name)
-- from table_name

--avg: tính giá trị trung bình cho một cột
-- nếu tất cả các giá trị trong cột là null kết quá của hàm avg sẽ là null 
-- nếu có vài cột có giá trị là null thì avg sẽ bỏ qua các giá trị null và tính giá trị trung bình cho các giá trị khác

-- hãy đếm số lượng khách hàng có trong bảng customers 
select COUNT(*) as "NumbersOfCustomers"
from Customers as c;

--tổng số tiền vận chuyển (Freight) của tất cả các đơn hàng 
select SUM(o.Freight) as "Tổng số tiền vận chuyển (Freight)"
from Orders as o;

-- tính trung bình số lượng đặt hàng (Quantity) của tất cả các sản phẩm trong bảng order details
select AVG(o.Quantity) as "Trung bình số lượng đặt hàng"
from [Order Details] as "o"

-- đếm số lượng, tính tổng số lượng hàng tồn kho và trung bình giá các sản phẩm có trong bảng product
-- bản chất của hàng tồn kho là lấy số lượng hàng có trong kho - số lượng hàng đã đc order 
-- unitsíntock - unitsorder
select (COUNT(p.UnitsInStock) - COUNT(p.UnitsOnOrder)) as "Số lượng hàng tồn kho", 
	   (SUM(p.UnitsInStock) - SUM(UnitsOnOrder)) as "Tổng số lượng của hàng tồn kho",
	   AVG(p.UnitPrice) as "Giá trị trung bình của các sản phẩm có trong kho"
from Products as "p";

-- BTAP 
-- hãy đếm số lượng đơn hàng từ order = 2 cách
--c1: dùng *
select COUNT(*) as "Số lượng đơn hàng"
from Orders as "o";
--c2: dùng mã đơn hàng
select COUNT(o.OrderID) as "Số lượng đơn hàng 2"
from Orders as "o";


--BTAP 2
-- từ bảng order details hãy tính trung bình cho cột unitprice và tính tổng cho cột quantity
select AVG(OD.UnitPrice) as "Giá trị trung bình trên một đơn vị sản phẩm",
	   SUM(OD.Quantity) as "Tổng số lượng của tất cả các sản phẩm"
from [Order Details] as "OD"