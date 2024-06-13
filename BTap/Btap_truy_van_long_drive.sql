




select *
from GIAOVIEN as "gv";

select *
from DETAI as "dt";

select *
from THAMGIADT;

select *
from CHUDE;

select *
from BOMON as "BM";

select *
from KHOA as "k";

select *
from CONGVIEC as "cv"

select *
from NGUOITHAN as "nt"

--Q35. Cho biết mức lương cao nhất của các giảng viên.
select gv.LUONG
from GIAOVIEN as "gv"
where gv.LUONG = (
		select MAX(LUONG)
		from GIAOVIEN
)


--Q36. Cho biết những giáo viên có lương lớn nhất.
select gv.*
from GIAOVIEN as "gv"
where gv.LUONG = (
		select MAX(LUONG)
		from GIAOVIEN
)

--Q37. Cho biết lương cao nhất trong bộ môn “HTTT”.
select gv.*
from (
select gv.*
from GIAOVIEN as gv
where gv.MABM = 'HTTT'
) as gv
where gv.LUONG = (
		select MAX(LUONG)
		from GIAOVIEN
)

--Q38. Cho biết tên giáo viên lớn tuổi nhất của bộ môn Hệ thống thông tin.
select gv.HOTEN
from (
	select gv1.*
	from GIAOVIEN as gv1
	where gv1.MABM = 'HTTT'
) as gv
where YEAR(gv.NGSINH) = (
	select MIN(YEAR(gv2.NGSINH))
	from GIAOVIEN as "gv2"
	where gv2.MABM = 'HTTT'
)


--Q39. Cho biết tên giáo viên nhỏ tuổi nhất khoa Công nghệ thông tin.
select gv.HOTEN, gv.NGSINH
from GIAOVIEN as gv 
left join BOMON as bm on bm.MABM = gv.MABM
where bm.MAKHOA = 'CNTT' and (gv.NGSINH) = (
	select MAX(gv1.NGSINH)
	from GIAOVIEN as "gv1"
	where gv1.MABM = bm.MABM and bm.MAKHOA = 'CNTT'
)

--Q40. Cho biết tên giáo viên và tên khoa của giáo viên có lương cao nhất.
select gv.HOTEN, k.TENKHOA, gv.LUONG
from GIAOVIEN as gv
left join BOMON as bm on gv.MABM = bm.MABM
full join KHOA as k on k.MAKHOA = bm.MAKHOA
where gv.LUONG = (
	select MAX(gv1.LUONG)
	from GIAOVIEN as gv1
)

--Q41. Cho biết những giáo viên có lương lớn nhất trong bộ môn của họ. 
select gv.HOTEN, gv.MABM, gv.LUONG
from GIAOVIEN as gv
where gv.LUONG >= ALL (
	select gv1.LUONG
	from GIAOVIEN as gv1
	where gv1.MABM = gv.MABM
)

--Q42. Cho biết tên những đề tài mà giáo viên Nguyễn Hoài An chưa tham gia.
select dt.TENDT
from DETAI as dt
where dt.TENDT NOT IN (
	select dt1.TENDT
	from DETAI as dt1
	full join GIAOVIEN as "gv" on gv.MAGV = dt.GVCNDT
	full join THAMGIADT as "tgdt" on gv.MAGV = tgdt.MAGV
	where gv.HOTEN = N'Nguyễn Hoaì An'
)

--Q43. Cho biết những đề tài mà giáo viên Nguyễn Hoài An chưa tham gia. Xuất ra tên đề tài, tên người chủ nhiệm đề tài.
select dt.TENDT, dt.GVCNDT, gv1.HOTEN
from DETAI as dt
left join GIAOVIEN as "gv1" on dt.GVCNDT = gv1.MAGV
where dt.TENDT NOT IN (
	select dt1.TENDT
	from DETAI as dt1
	full join GIAOVIEN as "gv" on gv.MAGV = dt.GVCNDT
	full join THAMGIADT as "tgdt" on gv.MAGV = tgdt.MAGV
	where gv.HOTEN = N'Nguyễn Hoaì An'
)

--Q44. Cho biết tên những giáo viên khoa Công nghệ thông tin mà chưa tham gia đề tài nào.
select gv.HOTEN
from GIAOVIEN as "gv"
join BOMON as bm on bm.MABM = gv.MABM
join KHOA as k on k.MAKHOA = bm.MAKHOA
where k.MAKHOA like 'CNTT' and gv.MAGV NOT IN (
	select gv1.MAGV
	from GIAOVIEN as gv1
	join THAMGIADT as tgdt on tgdt.MAGV = gv1.MAGV
)

--Q45. Tìm những giáo viên không tham gia bất kỳ đề tài nào
select gv.MAGV, gv.HOTEN
from GIAOVIEN as gv
where gv.MAGV NOT IN (
	select gv1.MAGV
	from GIAOVIEN as gv1
	join THAMGIADT as tgdt on gv.MAGV = tgdt.MAGV
)


--Q46. Cho biết giáo viên có lương lớn hơn lương của giáo viên “Nguyễn Hoài An”
select gv.HOTEN
from GIAOVIEN as gv
where gv.LUONG > (
	select gv1.LUONG
	from GIAOVIEN as gv1
	where gv1.HOTEN = N'Nguyễn Hoài An'
)

--Q47. Tìm những trưởng bộ môn tham gia tối thiểu 1 đề tài
select gv.MAGV, gv.HOTEN
from GIAOVIEN as gv
join BOMON as bm on bm.TRUONGBM = gv.MAGV
where gv.MAGV IN (
	select gv1.MAGV
	from GIAOVIEN as gv1
	join THAMGIADT as tgdt on gv1.MAGV = tgdt.MAGV
)

--Q50. Tìm những giáo viên có lương lớn hơn lương của tất cả giáo viên thuộc bộ môn “Hệ thống thông tin”
select gv.HOTEN
from GIAOVIEN as gv
where gv.MABM <> 'HTTT' and gv.LUONG >= (
		select MAX(gv2.LUONG)
		from GIAOVIEN as gv2
		where gv2.MABM = 'HTTT'
) 

--Q51. Cho biết tên khoa có đông giáo viên nhất
select k.TENKHOA, COUNT(gv.HOTEN)
from KHOA as k
join BOMON as bm on bm.MAKHOA = k.MAKHOA
join GIAOVIEN as gv on gv.MABM = bm.MABM
group by k.TENKHOA
having COUNT(gv.HOTEN) >= ALL (
	select COUNT(*)
	from GIAOVIEN as gv1
	join BOMON as bm1 on bm1.MABM = gv1.MABM
	join KHOA as k1 on k1.MAKHOA = bm1.MAKHOA
	group by k1.TENKHOA
)


--Q52. Cho biết họ tên giáo viên chủ nhiệm nhiều đề tài nhất
select gv.MAGV, gv.HOTEN, COUNT(dt.MADT)
from GIAOVIEN as "gv"
join DETAI as dt on gv.MAGV = dt.GVCNDT
group by gv.MAGV, gv.HOTEN
having COUNT(dt.MADT) >= ALL (
	select COUNT(dt1.MADT)
	from DETAI as dt1
	join GIAOVIEN as gv1 on gv1.MAGV = dt1.GVCNDT
	group by gv1.MAGV
)

--Q53. Cho biết mã bộ môn có nhiều giáo viên nhất
select gv.MABM, COUNT(gv.MAGV) as "Số lượng giáo viên của từng bộ môn"
from GIAOVIEN as gv
group by gv.MABM
having COUNT(gv.MAGV) >= ALL (
	select COUNT(gv1.MAGV)
	from GIAOVIEN as "gv1"
	group by gv1.MABM
)

--Q54. Cho biết tên giáo viên và tên bộ môn của giáo viên tham gia nhiều đề tài nhất.
select gv.MAGV, gv.HOTEN, bm.TENBOMON,COUNT(tgdt.MADT) 
from GIAOVIEN as gv
join THAMGIADT as tgdt on gv.MAGV = tgdt.MAGV
join BOMON as bm on bm.MABM = gv.MABM
group by gv.MAGV, gv.HOTEN, bm.TENBOMON
having COUNT(tgdt.MADT) >= ALL (
	select COUNT(tgdt1.MADT)
	from THAMGIADT as tgdt1
	join GIAOVIEN as gv1 on gv1.MAGV = tgdt1.MAGV
	group by gv1.MAGV
)

--Q55. Cho biết tên giáo viên tham gia nhiều đề tài nhất của bộ môn HTTT.
select gv.MAGV, gv.HOTEN, bm.TENBOMON,COUNT(tgdt.MADT) 
from ( 
	select gv2.*
	from GIAOVIEN as gv2
	where gv2.MABM = 'HTTT'
)
as gv
join THAMGIADT as tgdt on gv.MAGV = tgdt.MAGV
join BOMON as bm on bm.MABM = gv.MABM
group by gv.MAGV, gv.HOTEN, bm.TENBOMON
having COUNT(tgdt.MADT) >= ALL (
	select COUNT(tgdt1.MADT)
	from THAMGIADT as tgdt1
	join GIAOVIEN as gv1 on gv1.MAGV = tgdt1.MAGV
	group by gv1.MAGV
)

--Q56. Cho biết tên giáo viên và tên bộ môn của giáo viên có nhiều người thân nhất.
select gv.MAGV, gv.HOTEN, bm.TENBOMON, COUNT(nt.TEN) as "Số lượng người thân"
from GIAOVIEN as gv
join NGUOITHAN as nt on gv.MAGV = nt.MAGV
join BOMON as bm on gv.MABM = bm.MABM
group by gv.MAGV, gv.HOTEN, bm.TENBOMON
having COUNT(nt.TEN) >= ALL (
	select COUNT(nt1.TEN)
	from NGUOITHAN as nt1
	join GIAOVIEN as gv1 on gv1.MAGV = nt1.MAGV
	group by gv1.MAGV
)

--Q57. Cho biết tên trưởng bộ môn mà chủ nhiệm nhiều đề tài nhất.
select gv.MAGV, gv.HOTEN, COUNT(dt.TENDT) as "số lượng đề tài làm chủ nhiệm"
from GIAOVIEN as  gv
join DETAI as dt on dt.GVCNDT = gv.MAGV
group by gv.MAGV, gv.HOTEN
having COUNT(dt.TENDT) >= all (
	select COUNT(dt1.TENDT)
	from DETAI as dt1
	join GIAOVIEN as gv1 on gv1.MAGV = dt1.GVCNDT
	group by gv1.MAGV
)


