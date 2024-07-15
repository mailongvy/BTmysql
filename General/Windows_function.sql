
-- xep hang sản phẩm giả dần trên toàn bộ table
select p.ProductID, p.ProductName, p.CategoryID, p.UnitPrice,
	   RANK() OVER (Order by p.UnitPrice desc) as ranking
from Products as p;

-- xep hang sản phẩm giả dần trên the loai
select p.ProductID, p.ProductName, p.CategoryID, p.UnitPrice,
	   RANK() OVER (Partition by p.CategoryID Order by p.UnitPrice desc) as ranking
from Products as p;

-- Vi du 3
-- Tạo bảng "sinh_vien"
CREATE TABLE [sinh_vien] (
    [ma_sinh_vien] INT PRIMARY KEY,
    [ho_ten] NVARCHAR(255),
    [diem_trung_binh] DECIMAL(3, 2),
    [ma_lop_hoc] INT
);

-- Chèn 20 dòng dữ liệu thực tế vào bảng
INSERT INTO [sinh_vien] ([ma_sinh_vien], [ho_ten], [diem_trung_binh], [ma_lop_hoc])
VALUES
    (1, N'Nguyễn Văn A', 3.75, 101),
    (2, N'Trần Thị B', 3.88, 102),
    (3, N'Phạm Văn C', 3.75, 101),
    (4, N'Huỳnh Thị D', 3.92, 103),
    (5, N'Lê Văn E', 3.60, 102),
    (6, N'Ngô Thị F', 3.78, 101),
    (7, N'Trịnh Văn G', 3.65, 102),
    (8, N'Võ Thị H', 3.80, 103),
    (9, N'Đặng Văn I', 3.55, 101),
    (10, N'Hoàng Thị K', 3.95, 102),
    (11, N'Mai Thị L', 3.70, 103),
    (12, N'Lý Thị M', 3.62, 101),
    (13, N'Chu Thị N', 3.85, 102),
    (14, N'Đỗ Thị P', 3.58, 103),
    (15, N'Dương Văn Q', 3.72, 101),
    (16, N'Lâm Thị R', 3.85, 102),
    (17, N'Nguyễn Văn S', 3.68, 101),
    (18, N'Nguyễn Thị T', 3.75, 103),
    (19, N'Nguyễn Văn U', 3.93, 102),
    (20, N'Nguyễn Thị V', 3.67, 101);

-- xep hang sinh vien toan trường dựa trên điểm số giảm dần
select sv.ho_ten, sv.ma_sinh_vien, sv.diem_trung_binh,
	   RANK() OVER(order by sv.diem_trung_binh desc) as ranking
from sinh_vien as sv;

-- xep hang sinh vien toan trường dựa trên điểm số giảm dần theo từng lớp hc
select sv.ho_ten, sv.ma_sinh_vien, sv.diem_trung_binh, sv.ma_lop_hoc,
	   RANK() OVER(partition by sv.ma_lop_hoc order by sv.diem_trung_binh desc) as ranking
from sinh_vien as sv;

-- xep hang sinh vien toan trường dựa trên điểm số giảm dần theo từng lớp hc ko nhảy xếp hạng
--dense_rank xếp hạng ko nhảy xếp hạng (ko mất ranking)
select sv.ho_ten, sv.ma_sinh_vien, sv.diem_trung_binh, sv.ma_lop_hoc,
	   DENSE_RANK() OVER(partition by sv.ma_lop_hoc order by sv.diem_trung_binh desc) as ranking
from sinh_vien as sv;

-- xep hang sinh vien toan trường dựa trên điểm số giảm dần theo từng lớp hc ko bị trùng hạng
select sv.ho_ten, sv.ma_sinh_vien, sv.diem_trung_binh, sv.ma_lop_hoc,
	   ROW_NUMBER() OVER(partition by sv.ma_lop_hoc order by sv.diem_trung_binh desc) as ranking
from sinh_vien as sv;

--chúng ta sẽ  sử dụng hàm lag() để lấy thôgn tin các đơn đặt hàng và ngày đặt hàng của các đơn đtặ hàng trc đó của mỗi khách hàng
select o.CustomerID, o.OrderID, o.OrderDate,
	   LAG(o.OrderDate) over (partition by o.CustomerID order by o.Orderdate asc) as PreviousOrderDate
from Orders as o
order by o.CustomerID, o.OrderDate

-- tính tổng doanh số bán hàng hằng năm cho mỗi khách hàng và xếp hạng kahchs hàng dựa vào doanh số bán hàng

