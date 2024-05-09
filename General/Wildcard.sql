--wildcard: kí tự đại diện trong sql
-- %: represent zero or more characters(đại diện cho 0 hoặc nhìu kí tự)    bl%: các từ bắt đầu bằng bl
-- _: represent a single character(đại diện cho 1 kí tự đơn)               h_t: vd như hit hat hot
-- []: represent any single character within the brackets (đại diện cho 1 kí tự đơn có trong ngoặc)    h[oa]t: vd như hot hat
-- ^: represent any character not in the brackets(đại diện cho kí tự mà ko có trong ngoặc)                  h[^oa]t: vd như hit
-- -: represent any single character within the specified range (đại diện cho 1 khoảng kí tự)   vd: c[a-b]t: cat and cbt

-- hãy lọc ra các khách hàng có tên liên hệ bắt đầu bằng chữ 'A'
select *
from Customers as "c"
where c.ContactName like 'A%';

-- hãy lọc ra tất cả các khách hàng có tên liên hệ bắt đầu bằng chữ 'H' và có chữ cái thứ hai là bất kì kí tự nào
select *
from Customers as "c"
where c.ContactName like 'H_%';

-- hãy lọc ra các đơn hàng được gửi đến thành phố có chữ cái bắt đầu bằng chữ L có chữ cái thứ hai là u hoặc o
select *
from Orders as "o"
where o.ShipCity like 'L[uo]%';

-- hãy lọc ra các đơn hàng được gửi đến thành phố có chữ cái bắt đầu bằng chử L có chữ cái thứ hai không phải là u và o
select *
from Orders as "o"
where o.ShipCity like 'L[^uo]%';

-- hãy lọc ra các đơn hàng được gửi đến các thành phố có chữ cái bắt đầu bằng chữ cái L chữ cái thứ hai là chữ cái từ a - e
select *
from Orders as "o"
where o.ShipCity like 'L[a-e]%';

--Btap 1
-- hãy lấy ra tất cả các nhà cung cấp hàng có tên công ty bắt đầu bằng A và ko chứa kí tự b
select *
from Suppliers as "s"
where s.CompanyName like 'A%[^b]%';	

