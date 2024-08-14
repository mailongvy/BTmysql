-- index database
-- index là một c?u trúc dữ liệu ?? ??nh v? và truy c?p nhanh nh?t vào d? li?u trong các b?ng database
-- index là mộtt cách t?i ?u hi?u su?t truy v?n database b?ng vi?c gi?m l??ng truy c?p vào b? nh? khi truy v?n 

--nh?ng tình hu?ng nên ?ánh index
-- nh?ng b?ng có d? li?u l?n trên 100k dòng 
-- các column th??ng xuyên s? d?ng trong m?nh ?? where join và order by

-- nh?ng tình hu?ng ko nên s? d?ng index
-- c? s? d? li?u nh? ho?c s? d?ng tài nguyên ít 
-- d? li?u thay ??i th??ng xuyên
-- c?t ch?a d? li?u ko ?a d?ng 
-- c?t ch?a d? li?u text quá dài

-- CÁC TR??NG H?P S? T? ??NG T?O INDEX
-- khoá chính
-- khoá ngo?i
-- nh?ng c?t Unique

-- cú pháp 
-- create index index_name
-- on table_name (column_1, column_2)

-- giá tr? trong c?t này s? ko b? trùng l?p
-- create unique index index_name
-- on table_name (column_1, column_2)

select COUNT(*)
from Sales.SalesOrderDetail;

-- bật hiển thị thống kê về tài nguyên 
Set STATISTICS IO ON;

-- câu truy vấn
select *
from Sales.SalesOrderDetail
where CarrierTrackingNumber  like '1B2B-492F-A9';

-- tắt hiển thị thống kê về tài nguyên 
Set STATISTICS IO OFF;


-- đánh index cho bảng
-- tạo index cho CarrierTrackingNumber  
Create index idx_CarrierTrackingNumber
ON [Sales].[SalesOrderDetail] ([CarrierTrackingNumber]);


-- tạo index trên bảng person.address, cột addressLine1 để đnahs giá hiệu suất
-- tạo index cho cột product name trong bảng Production.product