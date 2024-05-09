-- group by: nhóm các dòng dữ liệu với nhau
-- dùng để nhóm các dòng dữ liệu có cùng giá trị
-- thường được dùng với các hàm như COUNT. MAX, MIN, SUM, AVG
--select column_names
-- from table_name
-- where condition
-- group by: column_names
-- order by: column_names

-- hãy cho bik mổi khách hàng đã đặt bao nhiu đơn hàng
select CustomerID, count(o.OrderID) as "số đơn hàng mà mỗi khách hàng đã nhận"
from Orders as "o"
group by CustomerID;

-- hãy tính giá trị trung bình theo mỗi nhà cung cấp sản phẩm
select p.SupplierID, AVG(p.UnitPrice) as "Giá trị trung bình của mỗi nhà cung cáp sản phẩm"
from Products as "p"
group by p.SupplierID;

--hãy cho bik mỗi thể loại có tổng số bao nhiu sản phảm trong kho
select p.CategoryID, SUM(p.UnitsInStock) as "Total unitinstock"
from Products as "p"
group by p.CategoryID;

-- hãy cho bik giá vận chuyển thấp nhất và lớn nhất của các đơn hàng theo từng thành phố quốc gia khác nhau
select o.ShipCountry, o.ShipCity, MAX(o.Freight) as "MaxFreight", MIN(o.Freight) as "MinFreight"
from Orders as "o"
group by o.ShipCountry, o.ShipCity
order by o.ShipCountry asc, o.ShipCity asc;

--btap
-- hãy thống kê số lượng nhân viên theo từng quốc gia khác nhau
select e.Country, count(e.EmployeeID)
from Employees as "e"
group by e.Country;

--Challenges1: Write an SQL statement 
--Thống kê số khách hàng ở từng quốc gia, từng thành phố
--Tìm các khách hàng có CompanyName có chữ a trong tên
--Sắp xếp theo chiều A-Z Country
select c.Country, c.City, count(c.CustomerID)
from Customers as "c"
where c.CompanyName like '%a%'
group by c.Country, c.City
order by c.Country asc, c.City desc;

--Challenges2: Write an SQL Statment
-- Tính tổng số tiền vận chuyển ở từng thành phố, quốc qua
-- Chỉ lấy những ShipName có có chữ 'b' 
--Sắp xếp theo chiều từ A-Z của ShipName
select o.ShipCountry, o.ShipCity, SUM(o.Freight)
from Orders as o
where o.ShipName like '%b%'
group by o.ShipCountry, o.ShipCity
order by o.ShipCountry asc, o.ShipCity asc;

