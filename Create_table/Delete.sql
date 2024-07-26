-- delete:  xoá dữ liệu trong bảng
-- sư dụng câu lệnh select into trước khi sử dụng câu lệnh delete

select *
Into Customers_1
from Customers;

select *
from Customers_1;

-- xoá đi khách hàng có mã là alfki
delete from Customers_1 
where CustomerID like 'ALFKI';

-- xoá đi toàn bộ khách hàng ở các quốc gia bắt đầu bằng U
delete from Customers_1
where Country like 'U%';

-- xoá sạch
delete from Customers_1;

Drop table Customers_1;

-- một số tình huống khong thể xoá dữ liệu 
-- khoá ngoại (foreign key) cuấ hình restrict hoặc no action 
-- các ràng buộc duy nhất hoặc các ràng buộc kiểm tra
-- quyền truy cập permissions
-- trong trạng thái giao dịch (transaction)
-- có triggers hoặc quy tắc (triggers and rules)
-- làm thay đổi dữ liệu liên quan đến tính toán (computed data)
-- làm thay đổi dữ liệu liên quan đến ghi lại sự kiện (auditing) 

select *
into Order_1
from Orders 

delete from Order_1
where OrderID Like '10248';

select *
into Products_1
from Products;

delete from Products_1
where UnitsInStock = 0;
