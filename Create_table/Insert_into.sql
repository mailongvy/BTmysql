--insert into: câu lệnh thêm dữ liệu vào bảng 
-- insert into table_name (column1, column2, column3)
-- values (value1, value2, value3, ...)

--insert into table_name 
-- values (value1, value2, value3, ...)

select *
from Customers as c;

Insert into Customers (CustomerID, CompanyName, ContactName, Phone)
values ('KH123', 'MLV.VN', 'Mai Long Vy', '0123456789');
