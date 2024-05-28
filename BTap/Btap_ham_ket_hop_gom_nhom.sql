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


--Q27. Cho biết số lượng giáo viên viên và tổng lương của họ.
select COUNT(*) as "SLGV", SUM (gv.LUONG) as "Totalsalary"
from GIAOVIEN as "gv";

--Q28. Cho biết số lượng giáo viên và lương trung bình của từng bộ môn.
select bm.MABM, COUNT(gv.HOTEN) as "Số lượng giáo viên", AVG(gv.LUONG) as "Lương trung bình" 
from GIAOVIEN as "gv"
join BOMON as "bm" on gv.MABM = bm.MABM
group by bm.MABM;

--Q29. Cho biết tên chủ đề và số lượng đề tài thuộc về chủ đề đó.
select cd.TENCD, COUNT(dt.MADT) as "Số lượng đề tài"
from CHUDE as "cd"
join DETAI as "dt" on dt.MACD = cd.MACD
group by cd.TENCD;

--Q30. Cho biết tên giáo viên và số lượng đề tài mà giáo viên đó tham gia.
select gv.MAGV, gv.HOTEN, COUNT(tgdt.MADT) as "Số lượng đề tài mà giáo viên đó tham gia"
from GIAOVIEN as "gv"
left join THAMGIADT as "tgdt" on gv.MAGV = tgdt.MAGV
group by gv.MAGV, gv.HOTEN
order by gv.MAGV asc;

--Q31. Cho biết tên giáo viên và số lượng đề tài mà giáo viên đó làm chủ nhiệm.
select gv.MAGV, gv.HOTEN, COUNT(dt.MADT) as "Số lượng đề tài mà giáo viên đó chủ nhiệm"
from GIAOVIEN as gv
join DETAI as "dt" on gv.MAGV = dt.GVCNDT
group by gv.MAGV, gv.HOTEN
order by gv.MAGV asc;

--Q32. Với mỗi giáo viên cho tên giáo viên và số người thân của giáo viên đó.
select gv.MAGV, gv.HOTEN,  COUNT(nt.MAGV) as "Số lượng người thân của giáo viên"
from GIAOVIEN as "gv"
left join NGUOITHAN as "nt" on gv.MAGV = nt.MAGV
group by gv.MAGV, gv.HOTEN
order by gv.MAGV asc;

--Q33. Cho biết tên những giáo viên đã tham gia từ 3 đề tài trở lên.
select gv.MAGV, gv.HOTEN, COUNT(tgdt.MADT) as "Số lượng đề tài mà giáo viên đó tham gia"
from GIAOVIEN as "gv"
left join THAMGIADT as "tgdt" on gv.MAGV = tgdt.MAGV
group by gv.MAGV, gv.HOTEN
having COUNT(tgdt.MADT) >= 3
order by gv.MAGV asc;

--Q34. Cho biết số lượng giáo viên đã tham gia vào đề tài Ứng dụng hóa học xanh
select COUNT(gv.HOTEN) as "Sô số lượng giáo viên tham gia đề tài Ứng dụng hoá học xanh"
from GIAOVIEN as gv
join THAMGIADT as "tgdt" on tgdt.MAGV = gv.MAGV
join DETAI as "dt" on tgdt.MADT = dt.MADT
where dt.TENDT like N'Ứng dụng hoá học xanh';





