-- join - left join - right join - full join
-- inner join(Join): trả về tất cả các hàng có ít nhất 1 giá trị của cả hai bảng
-- cấu trúc câu lệnh inner join
-- select column_name
-- from table1
-- inner join table 2
-- on table1.column_name = table2.column_name

-- sử dụng inner join 
-- từ bảng categories và products hãy in ra các thông tin sau đây:
-- mã thể loại, tên thể loại, mã sản phẩm, tên sản phẩm
select c.CategoryID, c.CategoryName, p.ProductID, p.ProductName
from Categories as "c" inner join Products as "p" on c.CategoryID = p.CategoryID;

-- sử dụng inner join 
-- từ bảng categories và products hãy in ra các thông tin sau đây:
-- mã thể loại, tên thể loại, số lượng từng sản phẩm
select c.CategoryID, c.CategoryName, COUNT(p.ProductID) as "Số lượng từng sản phẩm"
from Categories as "c" inner join Products as "p" on c.CategoryID = p.CategoryID
group by c.CategoryID, c.CategoryName;

-- sử dụng inner join hãy in ra những thông tin sau
-- mã đơn hàng
-- tên công ty khách hàng
select o.OrderID, c.CompanyName
from Orders as "o" inner join Customers as "c" on o.CustomerID = c.CustomerID;

-- ===================== left join (left outer join): trả lại tất cả các dòng từ bảng bên trái, 
--và các dòng đúng với điều kiện từ bảng bên phải
-- cấu trúc câu lệnh left join
-- select column_name
-- from table1
-- left join table 2
-- on table1.column_name = table2.column_name
select c.CategoryID, c.CategoryName, p.ProductID, p.ProductName
from Categories as "c" inner join Products as "p" on c.CategoryID = p.CategoryID;

-- sử dụng left join 
-- từ bảng categories và products hãy in ra các thông tin sau đây:
-- mã thể loại, tên thể loại, mã sản phẩm, tên sản phẩm
select c.CategoryID, c.CategoryName, p.ProductID, p.ProductName
from Categories as "c" left join Products as "p" on c.CategoryID = p.CategoryID;

-- sử dụng left join
-- từ bảng categories và products hãy in ra các thông tin sau đây:
-- mã thể loại, tên thể loại, số lượng từng sản phẩm
select c.CategoryID, c.CategoryName, COUNT(p.ProductID) as "Số lượng từng sản phẩm"
from Categories as "c" left join Products as "p" on c.CategoryID = p.CategoryID
group by c.CategoryID, c.CategoryName;

-- ===================== right join (right outer join): trả lại tất cả các dòng từ bảng bên phải, 
--và các dòng đúng với điều kiện từ bảng bên trái
-- cấu trúc câu lệnh left join
-- select column_name
-- from table1
-- right join table 2
-- on table1.column_name = table2.column_name

-- sử dụng right join hãy in ra thông tin dưới đây
-- mã đơn hàng
-- tên thông tin khách hàng
select o.OrderID, c.CompanyName
from Orders as "o" right join Customers as "c" on o.CustomerID = c.CustomerID;

-- ===================== full join (full outer join): trả lại tất cả các dòng đúng với 1 trong các bảng
-- cấu trúc câu lệnh full join
-- select column_name
-- from table1
-- full join table 2
-- on table1.column_name = table2.column_name

-- sử dụng right join hãy in ra thông tin dưới đây
-- mã đơn hàng
-- tên thông tin khách hàng

-- sử dụng full join
-- từ bảng products và categories hãy in ra các thông tin sau đây
-- mã thể loại 
-- tên thể loại
-- mã sản phẩm
-- tên sản phẩm
select c.CategoryID, c.CategoryName, p.ProductID, p.ProductName
from Categories as "c" full join Products as "p" on c.CategoryID = p.CategoryID;

-- câu hỏi 1(inner join) hãy liệt kê tên nhân viên và tên khách hàng của các đơn hàng trong bảng orders 
-- câu hỏi 2(left join) hãy liệt kê các nhà cung cấp và tên sản phẩm của các sản phẩm có trong products
-- bao gồm tất cả các sản phẩm mà ko có nhà cung cấp
-- câu hỏi 3(right join) hãy liệt kê tên khách hàng và tên đơn hàng của các đơn hàng trong bảng orders
--bao gồm cả các khách hàng không có đơn hàng
-- câu hỏi 4(full join) hãy liệt kê tên danh mục và tên các nhà cung cấp các sản phẩm trong bảng 
--products bao gồm cả danh mục và các nhà cung cấp không có sản phẩm


-- câu hỏi 1(inner join) hãy liệt kê tên nhân viên và tên khách hàng của các đơn hàng trong bảng orders 
select e.FirstName, e.LastName, c.ContactName	
from Employees as "e"
inner join Orders as "o"
on e.EmployeeID = o.EmployeeID
inner join Customers as "c"
on o.CustomerID = c.CustomerID

-- câu hỏi 2(left join) hãy liệt kê các nhà cung cấp và tên sản phẩm của các sản phẩm có trong products
-- bao gồm tất cả các sản phẩm mà ko có nhà cung cấp
select s.CompanyName, p.ProductName
from Products as p
left join Suppliers as s
on s.SupplierID = p.SupplierID;

-- câu hỏi 3(right join) hãy liệt kê tên khách hàng và tên đơn hàng của các đơn hàng trong bảng orders
--bao gồm cả các khách hàng không có đơn hàng
select c.ContactName, o.OrderID
from Orders as o
right join Customers as "c"
on o.CustomerID = c.CustomerID;

-- câu hỏi 4(full join) hãy liệt kê tên danh mục và tên các nhà cung cấp các sản phẩm trong bảng 
--products bao gồm cả danh mục và các nhà cung cấp không có sản phẩm
select c.CategoryName, s.CompanyName
from Categories as "c"
full join Products as "p"
on p.CategoryID = c.CategoryID
full join Suppliers as "s"
on p.SupplierID = s.SupplierID;
