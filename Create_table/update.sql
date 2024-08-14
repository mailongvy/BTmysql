-- update: câu lệnh cập nhật dữ liệu trong các cột trừ những các cột khoá chính 
-- cú pháp
-- update table_name
-- set column_1 = value_1, column_2 = value_2
-- where condition; 

select *
into Customers_1
from Customers;

select *
from Customers_1;

-- thay đổi địa chỉ của khách hàng có customerID là ALFKI
update Customers_1 
set [Address] = 'New Address'
where CustomerID like 'ALFKI';

select *
into Products_1
from Products;

-- tăng giá hết toàn bộ sản phẩm lên 10%
update Products
set UnitPrice = UnitPrice * 110 / 100;

-- có thể cập nhật rất nhiều cột
-- cập nhật thông tin của sản phẩm có ProductID là 7 trong bảng sản phẩm products để thay đổi tên sản phẩm thành "Máy tính xách tay đời mới"
-- và cập nhật giá bàn thành 999.99 do la
update Products_1
set ProductName = 'Máy tính xách tay đời mới', UnitPrice = 999.99
where ProductID = 7;

-- cập nhật thông tin của tất cả các khách hàng trong bảng customers có thành phố là paris để thay đổi quốc gia của họ thành pháp

update Customers_1
set Country = 'Pháp'
where City like 'Paris';