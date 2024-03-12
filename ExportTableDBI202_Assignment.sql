/*
===================== SQL XUẤT BẢNG =====================
*/

-- Sử dụng Database Dormitories
use Dormitories;
go

-- 1. Xuất bảng Staffs
		select	* from dbo.Staffs

-- 2. Xuất bảng Students
		select * from dbo.Students

	-- 2.1. Xuất view StudentsMale
		select * from StudentsMale

	-- 2.2. Xuất view StudentsFemale
		select * from StudentsFemale

-- 3. Xuất bảng DormBuilds
		select * from dbo.DormBuilds

		-- 3.1. Kiểm tra số lượng giường:
		select
			dobu.BuildID as 'Tòa',
			count(dobe.BedID) as 'Số giường tổng',
			count(stud.BedID) as 'Số giường đã dùng'
		from dbo.DormBuilds dobu,
		dbo.DormBeds dobe
--		dbo.StuDorms stud
		where dor.BuildID = dobe.BuildID
		group by dobu.BuildID
		order by dobu.BuildID asc

-- 4. Xuất bảng DormRooms
		select * from dbo.DormRooms

		-- 4.1. Xuất bảng giá tiền trong phòng
		select * from CostRoom

		-- 4.2. Kiểm tra phòng trống hay đã có người ở
		SELECT
			doro.RoomID AS 'Phòng',
			COUNT(dobe.BedID) AS 'Loại phòng',
			COUNT(stud.StudentID) AS 'Số giường đang dùng',
			(COUNT(dobe.BedID)-COUNT(stud.StudentID)) as 'Số giường còn trống'
			
		FROM
			dbo.DormRooms doro
		JOIN
			dbo.DormBeds dobe ON doro.RoomID = dobe.RoomID
		LEFT JOIN
			dbo.StuDorms stud ON dobe.BedID = stud.BedID AND stud.TermID = 'SP24'
		GROUP BY
			doro.RoomID
		order by doro.RoomID asc

-- 5. Xuất bảng DormBeds
		select * from dbo.DormBeds

		-- 5.1. Xuất bảng Tình trạng đặt giường
		SELECT
			dobe.BedID AS 'Mã giường',
			CASE
				WHEN stud.BedID IS NOT NULL THEN N'Đã đặt giường'
				ELSE N'Chưa đặt giường'
			END AS 'Trạng thái'
		FROM
			dbo.DormBeds dobe
		LEFT JOIN
			dbo.StuDorms stud ON dobe.BedID = stud.BedID AND stud.TermID = 'SU22'
		GROUP BY
			dobe.BedID, stud.BedID
		ORDER BY
			dobe.BedID ASC;

-- 6. Xuất bảng TermDorms
		select * from dbo.TermDorms
		order by DateBegin asc

-- 7. Xuất bảng SlotDorms
		select * from dbo.SlotDorms

-- 8. Xuất bảng StuDorms
		select * from dbo.StuDorms stud
		order by stud.BedID asc

		-- 8.1. Thông tin chi tiết hơn
		select * from MoreStuDormSU22
		select * from MoreStuDormFA22
		select * from MoreStuDormSP24

		-- 8.2. Kiểm tra chi tiết lịch sử sinh viên ở KTX
		select
			stud.StudentID as 'Mã Sinh viên',
			stu.StudentName as 'Họ và tên Sinh viên',
			stu.StudentGender as 'Giới tính',
			doro.BuildID as 'Tòa',
			doro.RoomNo as 'Phòng',
			dobe.BedNo as 'Giường',
			ted.Term as 'Kỳ',
			ted.YearTerm as 'Năm',
			ted.DateBegin as 'Ngày bắt đầu',
			ted.DateEnd as 'Ngày kết thúc'
		from
			dbo.Students stu, dbo.StuDorms stud, dbo.DormBeds dobe, dbo.TermDorms ted, dbo.DormRooms doro
		where 
			stud.StudentID = stu.StudentID
			and stud.StudentID = 'HE170807'
			and stud.BedID = dobe.BedID
			and stud.TermID = ted.TermID
			and dobe.RoomID = doro.RoomID
		order by ted.DateBegin asc
	-- 9. Xuất bảng ca làm của Nhân viên
		select * from dbo.StaDorms

		-- 9.1. Xuất thông tin chi tiết ca làm của nhân viên
		select
			stad.StaffID as 'Mã Nhân viên',
			sta.StaffName as 'Họ và tên Nhân viên',
			stad.BuildID as 'Tòa',
			stad.Slot as 'Ca làm việc',
			slod.TimeBegin as 'Giờ bắt đầu',
			slod.TimeEnd as 'Giờ kết thúc'
		from dbo.StaDorms stad
		join dbo.Staffs sta on stad.StaffID = sta.StaffID
		join dbo.SlotDorms slod on slod.Slot = stad.Slot
		ORDER BY stad.Slot, stad.BuildID, stad.StaffID asc

		-- 10. Xuất thông tin số điện, nước
		select * from dbo.DormElecWater

		-- 10.1. Xuất thông tin biến động số điện nước
		select
			dew.RoomID as 'Phòng',
			dew.NumberofElectronicAfter - dew.NumberofElectronicBefore as 'Số điện đã dùng',
			dew.NumberofWaterAfter - dew.NumberofWaterBefore as 'Số nước đã dùng'
		from dbo.DormElecWater dew

