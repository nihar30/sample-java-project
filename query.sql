
drop table if exists [dbo].[customer];
create table [dbo].[customer]
(
	[id] [int] not null,
	[firstName] [varchar](25) not null,
	[lastName] [varchar](40) not null,
	[age] [int] not null,
	[dateOfBirth] [datetime2](15) not null,

)
go
SELECT *
FROM OPENJSON(@json)
     WITH (id int, firstName nvarchar(50), lastName nvarchar(50),
           age int, dateOfBirth datetime2)
