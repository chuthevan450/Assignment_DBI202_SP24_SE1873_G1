/*
===================== SQL XÓA NỘI DUNG =====================
*/

-- Sử dụng Database Dormitories
use Dormitories;
go

-- 1. Xóa 1 hàng trên bảng Staffs
	-- 1.1. Xóa 1 hàng với StaffID cho trước
		delete from dbo.Staffs
		where StaffID = 'ST010'
	-- 1.2. Xóa 1 hàng với StaffName cho trước
		delete from dbo.Staffs
		where StaffName = N'Phạm Hải Yến'

-- 2. Xóa 1 hàng trên bảng Students
	-- 2.1. Xóa 1 hàng với StudentID cho trước
		delete from dbo.Students
		where StudentID = 'HS170492'
	-- 2.2. Xóa 1 hàng với StudentName cho trước
		delete from dbo.Students
		where StudentName = N'C114'

-- 3. Xóa 1 hàng trên bảng StudentDorm
	-- 2.1. Xóa 1 hàng với StudentID cho trước
		delete from dbo.StuDorms
		where StudentID = 'HS170492' and TermID = ''
-- 4. Xóa 1 hàng trên bảng StaDorms
	-- 4.1. Xóa 1 hàng với StaffID cho trước
		delete from dbo.StaDorms
		where StaffID = 'ST016'

		delete from dbo.DormElecWater
		where RoomID = 'A406'


		delete from dbo.StaDorms
		where BuildID = NULL
