/*
===================== TẠO BẢNG VIEW =====================
*/
use Dormitories
	-- 2.1. Bảng sinh viên trong trường (Nam)
	create view StudentsMale as
		select *
		from dbo.Students
		where StudentGender = 'Male';

	-- 2.2. Bảng sinh viên trong trường (Nữ)
	create view StudentsFemale as
		select *
		from dbo.Students
		where StudentGender = 'Female';

-- Bảng 4.1. View CostRoom
IF OBJECT_ID('CostRoom', 'V') IS NOT NULL
			DROP VIEW MoreStuDormSU22;
		GO

create view CostRoom as
		select
			room.RoomID as 'Phòng',
			count(bed.BedNo) as 'Số giường',

			CASE 
				WHEN count(bed.BedNo) = 6 THEN 3400000
				WHEN count(bed.BedNo) = 4 THEN 4200000
				WHEN count(bed.BedNo) = 3 THEN 4600000
			END AS 'Giá tiền phòng (1 kỳ)'
		
		from dbo.DormRooms room, dbo.DormBeds bed
		where 
			room.RoomID = bed.RoomID
		group by room.RoomID, room.BuildID

-- 8.1. Tạo bảng thông tin chi tiết sinh viên ở Dorm
	IF OBJECT_ID('MoreStuDormSU22', 'V') IS NOT NULL
			DROP VIEW MoreStuDormSU22;
		GO

		CREATE VIEW MoreStuDormSU22
		AS
			SELECT 
				stud.StudentID, stu.StudentName, stu.StudentGender, doro.RoomID, dobe.BedNo, ted.Term, ted.YearTerm
			FROM 
				dbo.StuDorms stud
			INNER JOIN 
				dbo.Students stu ON stud.StudentID = stu.StudentID
			INNER JOIN 
				dbo.DormBeds dobe ON dobe.BedID = stud.BedID
			INNER JOIN 
				dbo.DormRooms doro ON doro.RoomID = dobe.RoomID
			INNER JOIN 
				dbo.TermDorms ted ON ted.TermID = stud.TermID
			where ted.TermID = 'SU22'
			-- FA22
	IF OBJECT_ID('MoreStuDormFA22', 'V') IS NOT NULL
			DROP VIEW MoreStuDormFA22;
		GO

		CREATE VIEW MoreStuDormFA22
		AS
			SELECT 
				stud.StudentID, stu.StudentName, stu.StudentGender, doro.RoomID, dobe.BedNo, ted.Term, ted.YearTerm
			FROM 
				dbo.StuDorms stud
			INNER JOIN 
				dbo.Students stu ON stud.StudentID = stu.StudentID
			INNER JOIN 
				dbo.DormBeds dobe ON dobe.BedID = stud.BedID
			INNER JOIN 
				dbo.DormRooms doro ON doro.RoomID = dobe.RoomID
			INNER JOIN 
				dbo.TermDorms ted ON ted.TermID = stud.TermID
			where ted.TermID = 'FA22'
			-- SP24
	IF OBJECT_ID('MoreStuDormSP24', 'V') IS NOT NULL
			DROP VIEW MoreStuDormSP24;
		GO

		CREATE VIEW MoreStuDormSP24
		AS
			SELECT 
				stud.StudentID, stu.StudentName, stu.StudentGender, doro.RoomID, dobe.BedNo, ted.Term, ted.YearTerm
			FROM 
				dbo.StuDorms stud
			INNER JOIN 
				dbo.Students stu ON stud.StudentID = stu.StudentID
			INNER JOIN 
				dbo.DormBeds dobe ON dobe.BedID = stud.BedID
			INNER JOIN 
				dbo.DormRooms doro ON doro.RoomID = dobe.RoomID
			INNER JOIN 
				dbo.TermDorms ted ON ted.TermID = stud.TermID
			where ted.TermID = 'SP24'