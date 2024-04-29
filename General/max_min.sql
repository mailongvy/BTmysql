-- max min trong sql

-- tìm giá trị nhỏ nhất
-- select MIN(column_name)
-- from table_name; có thể kết hợp alias vào để thay đổi tên cột vào 

-- tìm giá trị lớn nhất
-- select MAX(column_name)
-- from table_name; có thể kết hợp alias vào để thay đổi tên cột vào 

-- viết câu lệnh sql tìm giá thấp nhất của sản phẩm trong bảng product
select MIN(UnitPrice) as "giá tiền thấp nhất"
from Products as p;

-- viết câu lệnh lấy ngày đặt hàng gần đây nhất từ bảng order
select MAX(o.OrderDate)
from Orders as o;

-- viết câu lệnh sql tìm ra sản phẩm (lấy mã và tên sản phẩm) có số lượng hàng tốt kho (unitsInstock)
select MAX(p.UnitsInStock) as MaxUnitsInStock
from Products as p;


-- Viết câu lệnh cho bik tuổi đời nhân viên lớn nhất của công ty
-- hint: ai có ngày sinh càng nhỏ thì người đó cảng lớn tuổi
select MIN(e.BirthDate) as "Người có tuổi đời lớn nhất"
from Employees as e;

--Thử thách:
--TT1: Viết câu lệnh SQL tìm ra số lượng sản phẩm nhỏ nhất trên mỗi đơn vị của các sản phẩm trong bảng Products
select Min(p.QuantityPerUnit) as "Số lượng sản phẩm nhỏ nhất trên mỗi đơn vị"
from Products as p;
--TT2: Viết câu lệnh SQL cho biết địa chỉ gần nhất và quốc gia lớn nhất của các nhà cung cấp trong bảng Suppliers
-- địa chỉ gần nhất
select MIN(s.Address) as "địa chỉ gần nhất", MIN(s.Country) as "quốc gia lớn nhất"
from Suppliers as s;


