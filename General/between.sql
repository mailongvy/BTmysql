--between: toán tử này là toán tử chọn các giá trị trong một phạm vi nhất định các giá trị có thể là số, văn bản, ngày tháng
-- toán tử between bao gồm: giá trị bắt đầu và giá trị kết thúc
-- select column_name
-- from table_name
-- where column_name between value1 and value 2

-- btap
-- Lấy danh sách các sản phẩm có giá bán trong khoảng từ 10 đến 20 đô la
select *
from Products as "p"
where p.UnitPrice between 10 and 20;

--lấy danh sách các đơn đặt hàng được đặt trong khoảng thời gian từ 1996-07-01 -> 1996-07-31
select *
from Orders as "o"
where o.OrderDate between '1996-07-01' and '1996-07-31';

--tính tổng số tiền vận chuyển của các đơn đặt hàng được đặt trong khoảng thời gian từ 1996-07-01 -> 1996-07-31
select SUM(o.Freight) as "Tổng số tiền vận chuyển"
from Orders as "o"
where o.OrderDate between '1996-07-01' and '1996-07-31';

--btap1
--lấy danh sách các đơn đặt hàng có ngày đặt hàng trong khoảng từ ngày 1/1/1997 -> 31/12/1997 và được vận chuyện bằng đường tàu
-- thuỷ (Shipvia = 3)
select *
from Orders as "o"
where (o.OrderDate between '1997-01-01' and '1997-12-31') AND o.ShipVia = 3;