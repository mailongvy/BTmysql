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

--Q31. Cho biết tên giáo viên và số lượng đề tài mà giáo viên đó làm chủ nhiệm.
--Q32. Với mỗi giáo viên cho tên giáo viên và số người thân của giáo viên đó.
--Q33. Cho biết tên những giáo viên đã tham gia từ 3 đề tài trở lên.
--Q34. Cho biết số lượng giáo viên đã tham gia vào đề tài Ứng dụng hóa học xanh

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
select 
from GIAOVIEN
