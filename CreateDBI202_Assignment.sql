/*
===================== SQL TẠO DATABASE, TẠO BẢNG =====================
*/

-- Tạo Database Dormitories
create database Dormitories;
go

-- Xóa Database
drop database Dormitories
go

-- Sử dụng Database
use Dormitories;
go

-- Xóa bảng (chỉ sử dụng khi cần thiết)
drop table Staffs;
drop table Students;
drop table DormBuilds;
drop table DormRooms;
drop table DormBeds;
drop table TermDorms;
drop table SlotDorms;
drop table StuDorms;
drop table StaDorms;
drop table DormElecWater;
drop table Gender;

-- 1. Tạo bảng 
	-- 1.0. Tạo bảng quan hệ giới tính
	 create table Gender (
		Gender varchar(6) primary key
	 )

	-- 1.1. Bảng Nhân viên quản lý KTX
	create table Staffs (
		StaffID varchar(5) primary key,
		StaffName nvarchar(30) not null,
		StaffBirth date,
		StaffGender varchar(6) not null,
		foreign key (StaffGender) references Gender(Gender),
		StaffPhone varchar(10),
		StaffEmail nvarchar(30) not null
	)

	-- 1.2. Bảng Sinh viên trong trường
	create table Students (
		StudentID varchar(10) primary key,
		StudentName nvarchar(30) not null,
		StudentBirth date,
		StudentGender varchar(6) not null,
		foreign key (StudentGender) references Gender(Gender),
		StudentPhone varchar(10),
		StudentEmail nvarchar(30) not null
	)

	-- 1.3. Bảng thông tin tòa nhà KTX
	 create table DormBuilds (
		BuildID varchar(11) primary key
	 )


	 -- 1.4. Bảng thông tin phòng KTX
	 create table DormRooms (
		RoomID varchar(4) primary key,
		BuildID varchar(11),
		foreign key (BuildID) references DormBuilds(BuildID),
		RoomNo int,
		RoomGender varchar(6) default 'Male',
		foreign key (RoomGender) references Gender(Gender)
	 )

	 -- 1.5. Bảng thông tin giường KTX
	 create table DormBeds (
		BedID varchar(6) primary key,
		RoomID varchar(4),
		foreign key (RoomID) references DormRooms(RoomID),
		BedNo int
	 )

	 -- 1.6. Bảng thông tin kỳ học KTX
	 create table TermDorms (
		TermID varchar(4) primary key,
		Term varchar(6),
		YearTerm int,
		DateBegin date,
		DateEnd date
	 )

	 -- 1.7. Bảng thông tin Slot cho Nhân viên KTX
	 create table SlotDorms (
		Slot int primary key,
		TimeBegin TIME,
		TimeEnd TIME
	 )

	 
	 -- 1.8. Bảng sinh viên ở KTX
	 create table StuDorms (
		BedTermID varchar(11) primary key,
		StudentID varchar(10),
		foreign key (StudentID) references Students(StudentID),
		BedID varchar(6),
		foreign key (BedID) references DormBeds(BedID),
		TermID varchar(4),
		foreign key (TermID) references TermDorms(TermID),
	 )

	 -- 1.9. Bảng quản lý Nhân viên KTX
	 create table StaDorms (
		StaffID varchar(5) unique,
		foreign key (StaffID) references Staffs(StaffID),
		BuildID varchar(11),
		foreign key (BuildID) references DormBuilds(BuildID),
		Slot int,
		foreign key (Slot) references SlotDorms(Slot),
	 )

	 -- 1.10. Bảng quản lý số điện, số nước
	 create table DormElecWater (
		RoomID varchar(4) unique,
		foreign key (RoomID) references DormRooms(RoomID),
		NumberofElectronicBefore float,
		NumberofElectronicAfter float,
		NumberofWaterBefore float,
		NumberofWaterAfter float,
	 )

	 
