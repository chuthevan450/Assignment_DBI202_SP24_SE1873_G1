/*
	========== UPDATE DỮ LIỆU BẢNG ==========
*/

use Dormitories

-- 1. Update giới tính từ Nam (Male) sang Nữ (Female) cho phòng KTX
update dbo.DormRooms
set RoomGender = 'Female'
where RoomID = 'A107'; -- Ở đây có thể thay đổi sang bất kỳ phòng nào nếu muốn