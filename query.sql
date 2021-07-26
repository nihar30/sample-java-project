drop table if exists [dbo].[customer];
create table [dbo].[customer]
(
	[C_CUSTKEY] [int] not null,
	[C_NAME] [varchar](25) not null,
	[C_ADDRESS] [varchar](40) not null,
	[C_NATIONKEY] [int] not null,
	[C_PHONE] [char](15) not null,
	[C_ACCTBAL] [decimal](15, 2) not null,
	[C_MKTSEGMENT] [char](10) not null,
	[C_COMMENT] [varchar](117) not null
)
go
