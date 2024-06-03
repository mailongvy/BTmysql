

--Q39. Cho biết tên giáo viên nhỏ tuổi nhất khoa Công nghệ thông tin.
--Q40. Cho biết tên giáo viên và tên khoa của giáo viên có lương cao nhất.
--Q41. Cho biết những giáo viên có lương lớn nhất trong bộ môn của họ.
--Q42. Cho biết tên những đề tài mà giáo viên Nguyễn Hoài An chưa tham gia.
--Q43. Cho biết những đề tài mà giáo viên Nguyễn Hoài An chưa tham gia. Xuất ra tên đề tài, tên người chủ nhiệm đề tài.
--Q44. Cho biết tên những giáo viên khoa Công nghệ thông tin mà chưa tham gia đề tài nào.
--Q45. Tìm những giáo viên không tham gia bất kỳ đề tài nào
--Q46. Cho biết giáo viên có lương lớn hơn lương của giáo viên “Nguyễn Hoài An”
--Q47. Tìm những trưởng bộ môn tham gia tối thiểu 1 đề tài
--Q48. Tìm giáo viên trùng tên và cùng giới tính với giáo viên khác trong cùng bộ môn
--Q49. Tìm những giáo viên có lương lớn hơn lương của ít nhất một giáo viên bộ môn “Công nghệ phần mềm”
--Q50. Tìm những giáo viên có lương lớn hơn lương của tất cả giáo viên thuộc bộ môn “Hệ thống thông tin”
--Q51. Cho biết tên khoa có đông giáo viên nhất
--Q52. Cho biết họ tên giáo viên chủ nhiệm nhiều đề tài nhất
--Q53. Cho biết mã bộ môn có nhiều giáo viên nhất
--Q54. Cho biết tên giáo viên và tên bộ môn của giáo viên tham gia nhiều đề tài nhất.
--Q55. Cho biết tên giáo viên tham gia nhiều đề tài nhất của bộ môn HTTT.
--Q56. Cho biết tên giáo viên và tên bộ môn của giáo viên có nhiều người thân nhất.
--Q57. Cho biết tên trưởng bộ môn mà chủ nhiệm nhiều đề tài nhất.

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
select *
from GIAOVIEN as "gv"
where YEAR(gv.NGSINH)




