--insert into: câu lệnh thêm dữ liệu vào bảng 
-- insert into table_name (column1, column2, column3)
-- values (value1, value2, value3, ...)

--insert into table_name 
-- values (value1, value2, value3, ...)

select *
from Customers as c;

select *
from Employees as e;

select *
from Shippers as s;

-- thêm một khách hàng
Insert into Customers (CustomerID, CompanyName, ContactName, Phone)
values ('KH123', 'MLV.VN', 'Mai Long Vy', '0123456789');

-- them một khách hàng với tất cả các cột
Insert into Customers 
values ('KH456', 'MLV.VN', 'Mai Long Vy', '0123456789', '-', null, null, null, null, null, null);

-- thêm nhiều khách hàng mới cùng lúc
Insert into Customers (CustomerID, CompanyName, ContactName, Phone)
values 
('KH124', 'MLV.VN', 'Mai Long Vy', '0123456789'),
('KH125', 'MLV.VN', 'Mai Long Vy', '0123456789'),
('KH126', 'MLV.VN', 'Mai Long Vy', '0123456789'),
('KH127', 'MLV.VN', 'Mai Long Vy', '0123456789');

-- thêm một sản phẩm mới vào bảng products
Insert into Products(ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock) 
values ('New Product', 1, 2, '24 bottles', 10.99, 100);

-- viết câu lệnh để thêm nhà cung cấp vào bảng suppliers
insert into Suppliers(CompanyName, [ContactName], [ContactTitle], [Address], [City], [Region], [PostalCode], [Country], [Phone], Fax, HomePage)
values
('New Supplier', 'John Smith', 'Sale Manager', '123 Supplier Street', 'New York', 'NY', '10001', 'USA', '555-555-5555', '555-555-5556', 'http://www.newsupplier.com');

insert into Orders(CustomerID, EmployeeID, OrderDate, ShipVia) 
values ('KH123', 1, GETDATE(), 2);