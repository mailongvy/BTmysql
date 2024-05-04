--các phép toán tiêu biểu như + - * / %
--btap 1
--tính số lượng sản phẩm còn lại trong kho sau khi đã bán hết các sản phẩm đã được đặt hàng (UnitsOnorder)
-- stockremaining(hàng tồn kho) = unitinstock(hàng có trong kho) - unitsonorder(hàng đã được đặt)
select p.ProductID, 
	   p.ProductName,
	   p.UnitsInStock,
	   p.UnitsOnOrder,
	   (p.UnitsInStock - p.UnitsOnOrder) as "Số lượng hàng tồn kho"
from Products as "p";

-- btap 2
-- tính giá trị đơn hàng chi tiết cho tất cả các sản phẩm trong bảng orderdetails
-- orderdetailvalue = unitonprice * quantity
select OD.OrderID as "Mã order",
	   OD.ProductID as "Mã sản phẩm",
	   OD.UnitPrice as "Giá trị đơn hàng trên một đơn vị sản phẩm",
	   OD.Quantity as "Số lượng hàng",
	   OD.UnitPrice * OD.Quantity as "Giá trị đơn hàng chi tiết từng sản phẩm"
from [Order Details] as "OD";

--btap 3
-- tính tỉ lệ giá vận chuyển đơn đặt hàng (Freight) trung bình của các đơn hàng trong bảng order so với giá trị vận chuyển của đơn hàng
-- lớn nhất
-- FreightRatio: AVG(Freight)/MAX(Freight)
select (AVG(o.Freight) / MAX(Freight)) as "FreightRatio"
from Orders as "o";

--BTAP 1:
-- hãy liệt kê danh sách các sản phẩm, và giá của từng sản phẩm sau khi dc giảm 10%
--c1: dùng phép nhân + pháp chia
select *,
	   (UnitPrice * 90 / 100) as "Giá sau khi được giảm"
from Products as "p";
--c2: dung phép nhân
select *,
	   (UnitPrice * 0.9) as "Giá sau khi được giảm"
from Products as "p";

-- Thử thách 2. Viết câu lệnh SQL gộp họ và tên của Nhân viên
select e.FirstName,
	   e.LastName,
	   (e.FirstName + ' ' + e.LastName) as "Fullname"
from Employees as "e";