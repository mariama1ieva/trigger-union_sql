use CodeAcademy



create table Studentss(
[Id] int primary key identity(1,1),
[Name] nvarchar(50) not null,
[Surname] nvarchar(100),
[Age] int,
[Email] nvarchar(100) unique,
[Address] nvarchar(150),
)

insert into Studentss([Name],[Surname],[Email],[Age],[Address])
values ('Meryem','Aliyeva','mery@gmail.com',23,'Dernegul'),
('Haci','Ahmedov','haci@gmail.com',29,'Bileceri'),
('Ayshe','Ayamazova','ayshe@gmail.com',24,'Kanada'),
('Aytac','Reshidova','aytac@gmail.com',33,'Suraxani'),
('Fizuli','Aliyev','fizuli@gmail.com',25,'Ahmadli'),
('Tofiq','Nasibli','tofiq@gmail.com',19,'hezi')




select GETDATE()

create table StudentssArchive(
  [Id] int,
  [Name] nvarchar(100),
  [Surname] nvarchar(100),
  [Age] int,
  [Email] nvarchar(100) unique,
  [Address] nvarchar(100),
  [Operation] nvarchar(100),
  [Date] datetime
)

select *from Studentss

select *from StudentssArchive

--create procedure usp_archiveStudents
--@Id int
--as
--begin
--insert into StudentssArchive([Id],[Name],[Surname],[Age],[Email],[Address],[Operation],[Date])
--select[Id],[Name],[Surname],[Age],[Email],[Address],'Delete',getDate() from Studentss
--where [Id]=@Id
--delete from Studentss where [Id]= @Id
--end

exec usp_archiveStudents @Id = 3
exec usp_archiveStudents @Id = 2
exec usp_archiveStudents @Id = 1
exec usp_archiveStudents @Id = 4
exec usp_archiveStudents @Id = 5
exec usp_archivestudents @Id = 6


CREATE TRIGGER trg_ArchiveStudents
ON Studentss
AFTER DELETE
AS
BEGIN
    INSERT INTO StudentssArchive ([Id], [Name], [Surname], [Age], [Email], [Address], [Operation], [Date])
    SELECT [Id], [Name], [Surname], [Age], [Email], [Address], 'Delete', GETDATE()
    FROM DELETED;
END;



