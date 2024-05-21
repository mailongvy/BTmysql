
--Q25. Tìm những giáo viên là trưởng bộ môn.
--Q26. Cho biết họ tên và mức lương của các giáo viên.

-- sử dụng bản quản lí đề tài
select *
from GIAOVIEN as "gv";

select *
from DETAI as "dt";

select *
from THAMGIADT;


select *
from BOMON as "BM";

select *
from KHOA as "k";

select *
from CONGVIEC as "cv"

--Q1. Cho biết họ tên và mức lương của các giáo viên nữ.
select gv.HOTEN, gv.LUONG
from GIAOVIEN as "gv"
where NOT gv.PHAI = 'Nam';

 --Q2. Cho biết họ tên của các giáo viên và lương của họ sau khi tăng 10%.
select gv.HOTEN, gv.LUONG, gv.LUONG * 110 / 100 as "Lương sau khi tăng 10%"
from GIAOVIEN as "gv";

--Q3. Cho biết mã của các giáo viên có họ tên bắt đầu là “Nguyễn” và lương trên $2000 hoặc
--giáo viên là trưởng bộ môn nhận chức sau năm 1995.
select distinct gv.MAGV, gv.HOTEN
from GIAOVIEN as "gv", BOMON as "bm"
where gv.MAGV = bm.TRUONGBM and
	  gv.HOTEN like N'Nguyễn%' and gv.LUONG >= 2000
      or bm.TRUONGBM is not null and  YEAR(bm.NGAYNHANCHUC) > 1995;

--Q4. Cho biết tên những giáo viên khoa Công nghệ thông tin.
select	gv.HOTEN, gv.MABM
from GIAOVIEN as "gv", BOMON as "bm"
where gv.MABM = bm.MABM and
	  bm.MAKHOA = 'CNTT';

--Q5. Cho biết thông tin của bộ môn cùng thông tin giảng viên làm trưởng bộ môn đó.
select bm.*, gv.HOTEN
from GIAOVIEN as "gv", BOMON as "bm"
where gv.MAGV = bm .TRUONGBM and
	  bm.TRUONGBM is not null;
--Q6. Với mỗi giáo viên, hãy cho biết thông tin của bộ môn mà họ đang làm việc.
select gv.*, bm.*
from GIAOVIEN as "gv", BOMON as "bm"
where gv.MABM = bm.MABM;

--Q7. Cho biết tên đề tài và giáo viên chủ nhiệm đề tài.
select dt.TENDT, dt.GVCNDT, gv.HOTEN
from DETAI as "dt", GIAOVIEN as "gv"
where gv.MAGV = dt.GVCNDT;

--Q8. Với mỗi khoa cho biết thông tin trưởng khoa.
select k.*, gv.*
from KHOA as "k", GIAOVIEN as "gv"
where k.TRUONGKHOA = gv.MAGV;

--Q9. Cho biết các giáo viên của bộ môn “Vi sinh” có tham gia đề tài 006.
select distinct  gv.*
from GIAOVIEN as "gv", THAMGIADT as "thamgiadt"
where thamgiadt.MAGV = gv.MAGV and
	  gv.MABM = 'VS' and thamgiadt.MADT = '006';

--Q10. Với những đề tài thuộc cấp quản lý “Thành phố”, cho biết mã đề tài, đề tài thuộc về chủ
--đề nào, họ tên người chủ nghiệm đề tài cùng với ngày sinh và địa chỉ của người ấy.
select dt.MADT, dt.GVCNDT, gv.HOTEN, gv.NGSINH, gv.DIACHI
from GIAOVIEN as "gv", DETAI as "dt"
where dt.GVCNDT = gv.MAGV and
	  dt.CAPQL = N'Trường';

--Q11. Tìm họ tên của từng giáo viên và người phụ trách chuyên môn trực tiếp của giáo viên
--đó.
select distinct gv.HOTEN, gv1.HOTEN as "Người phụ trách chuyên môn trực tiếp của giáo viên"
from GIAOVIEN as gv, GIAOVIEN as "gv1"
where gv1.GVQLCM = gv.MAGV;

--Q12. Tìm họ tên của những giáo viên được “Nguyễn An Trung” phụ trách trực tiếp.
select gv.*
from GIAOVIEN as "gv"
left join GIAOVIEN as "gv1"
on gv.GVQLCM = gv1.MAGV
where gv1.HOTEN = N'Nguyễn An Trung';

--Q13. Cho biết tên giáo viên là trưởng bộ môn “Hệ thống thông tin”.
select gv.*
from GIAOVIEN as "gv"
join BOMON as "bm" on gv.MAGV = bm.TRUONGBM
where bm.TENBOMON = N'Hệ thống thông tin'

--Q14. Cho biết tên người chủ nhiệm đề tài của những đề tài thuộc chủ đề Quản lý giáo dục.
select distinct gv.*
from GIAOVIEN as "gv" 
join DETAI as "dt" on gv.MAGV = dt.GVCNDT
where dt.MACD = 'QLGD';

--Q15. Cho biết tên các công việc của đề tài HTTT quản lý các trường ĐH có thời gian bắt đầu
--trong tháng 3/2008.
select cv.*
from CONGVIEC as "cv"
left join DETAI as "dt"
on cv.MADT = dt.MADT
where dt.TENDT = N'HTTT quản lý các trường ĐH' and cv.NGAYBD between '2008-03-01' and '2008-03-31';

--Q16. Cho biết tên giáo viên và tên người quản lý chuyên môn của giáo viên đó.
select gv1.HOTEN, gv.HOTEN as "Họ tên giáo viên phụ trách chuyên môn"
from GIAOVIEN as gv
right join GIAOVIEN as gv1
on gv.MAGV = gv1.GVQLCM;

--Q17. Cho các công việc bắt đầu trong khoảng từ 01/01/2007 đến 01/08/2007.
select cv.*
from CONGVIEC as "cv"
where cv.NGAYBD between '2007-01-01' and '2007-08-01';

--Q18. Cho biết họ tên các giáo viên cùng bộ môn với giáo viên “Trần Trà Hương”.
select gv.HOTEN
from GIAOVIEN as "gv"
where gv.MABM = 'HTTT'
except 
select gv1.HOTEN
from GIAOVIEN as "gv1"
where gv1.HOTEN = N'Trần Trà Hương';

--Q19. Tìm những giáo viên vừa là trưởng bộ môn vừa chủ nhiệm đề tài.
select distinct gv.*
from GIAOVIEN as "gv"
join DETAI as "dt"
on gv.MAGV = dt.GVCNDT
join BOMON as "bm"
on bm.TRUONGBM = dt.GVCNDT;

--Q20. Cho biết tên những giáo viên vừa là trưởng khoa và vừa là trưởng bộ môn.
select distinct gv.*
from GIAOVIEN as "gv"
join BOMON as "bm"
on gv.MAGV = bm.TRUONGBM
join KHOA as "k"
on bm.TRUONGBM = k.TRUONGKHOA;

--Q21. Cho biết tên những trưởng bộ môn mà vừa chủ nhiệm đề tài.
select distinct gv.*
from GIAOVIEN as "gv"
join DETAI as "dt"
on dt.GVCNDT = gv.MAGV
join BOMON as "bm"
on dt.GVCNDT = bm.TRUONGBM;

--Q22. Cho biết mã số các trưởng khoa có chủ nhiệm đề tài.
select distinct gv.MAGV
from GIAOVIEN as "gv"
join DETAI as "dt"
on gv.MAGV = dt.GVCNDT
join BOMON as "bm"
on bm.TRUONGBM = dt.GVCNDT;

--Q23. Cho biết mã số các giáo viên thuộc bộ môn “HTTT” hoặc có tham gia đề tài mã “001”
select distinct gv.MAGV
from GIAOVIEN as "gv"
full join DETAI as "dt"
on gv.MAGV = dt.GVCNDT
where gv.MABM = 'HTTT' or dt.MADT = '001';

--Q24. Cho biết giáo viên làm việc cùng bộ môn với giáo viên 002.


