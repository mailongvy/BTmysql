-- truy vấn đệ quy
-- c?u trúc 
-- with CTE_name() {
--		select
--		from
--		where
--		UNION ALL
--		recursive member
--		select
--		from
--		join CTE_name on ...
--}

﻿-- fibo
WITH fibo(prev_n, n) AS (
	-- khoi tao
	SELECT 
		0 as prev_n,
		1 as n

	UNION ALL
	-- de quy
	SELECT 
		n as prev_n,
		prev_n+n as n
	FROM fibo
)
SELECT * FROM fibo
OPTION (MAXRECURSION 5);
-- Sn=S(n-1)+S(n-2)
--0 1 1 2 3 5 8 ...

--Sử dụng truy vấn đệ quy để tạo một cây cấu trúc quản lý của nhân viên trong bảng "Employees“.
--Trong đó “ReportsTo” chí là mã của người quản lý.
declare @EmployeeId int
set @EmployeeId=2;

WITH e_cte as (
	--khởi tạo
	select e.EmployeeID, e.FirstName+' '+e.LastName as Name, e.ReportsTo as ManagerID,
		   0 as Level
	from Employees e
	where e.EmployeeID = @EmployeeId

	Union all

	-- đệ quy
	Select e1.EmployeeID,
		   e1.FirstName+' '+e1.LastName as Name,
		   e1.ReportsTo as ManagerID,
		   Level + 1 as Level
	from Employees e1
	join e_cte on e1.ReportsTo = e_cte.EmployeeID
)

select * from e_cte
Option (MAXRECURSION 500);





