/*
	TRIGGER
*/

-- 4. 

if object_id ('PreventMixedGender', 'Tr') is not null
	drop trigger PreventMixedGender
go

CREATE TRIGGER PreventMixedGender
ON StuDorms
AFTER INSERT
AS
BEGIN
    DECLARE @sStudentGender VARCHAR(6)
    DECLARE @sRoomGender VARCHAR(6)
	SELECT @sStudentGender = stu.StudentGender 
	FROM dbo.Students stu, dbo.StuDorms stud
	where stud.StudentID = stu.StudentID

    SELECT @sRoomGender = doro.RoomGender 
	FROM dbo.DormRooms doro, dbo.DormBeds dobe
	where doro.BuildID = dobe.BuildID
		and doro.RoomNo = dobe.RoomNo
    
		

    IF @sStudentGender <> @sRoomGender
        RAISEERROR('Do not enter information of the opposite sex into the room', 16, 1)
        ROLLBACK TRANSACTION
END;