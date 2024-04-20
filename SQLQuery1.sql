create database CodeAcademy
use CodeAcademy

create table Countries(
[Id] int primary key identity(1,1),
[Name] nvarchar(255) not null
)



create table Cities(
[Id] int primary key identity(1,1),
[Name] nvarchar(255) not null,
[CountryId] int foreign key references  Countries(Id)
)



create table Teachers(
[Id] int primary key identity(1,1),
[FullName] nvarchar(255) not null,
[Salary] decimal,
[CityId] int foreign key references  Cities(Id)
)


create table Students(
[Id] int primary key identity(1,1),
[FullName] nvarchar(255) not null,
[Email] nvarchar(255) not null,
[Age] int,
[CityId] int foreign key references  Cities(Id)
)

create table Rooms(
[Id] int primary key identity(1,1),
[Name] nvarchar(255) not null,
[Capacity] int
)

create table Groups(
[Id] int primary key identity(1,1),
[Name] nvarchar(255) not null,
[RoomId] int foreign key references  Rooms(Id)
)


create table TeacherGroup(
[Id] int primary key identity(1,1),
[TeacherId] int foreign key references  Teachers(Id),
[GroupId] int foreign key references  Groups(Id)
)
create table StudentGroup(
[Id] int primary key identity(1,1),
[TStudentrId] int foreign key references  Students(Id),
[GroupId] int foreign key references  Groups(Id)
)

create table StaffMembers(
[Id] int primary key identity(1,1),
[Name] nvarchar(255) not null,
[CityId] int foreign key references  Cities(Id)

)

create table Roles(
[Id] int primary key identity(1,1),
[Name] nvarchar(255) not null,
[CityId] int foreign key references  Cities(Id)
)




