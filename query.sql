select 
	cast(bulkcolumn as nvarchar(max)) as jsondata 
from 
	openrowset(bulk './user1.json',  single_clob) as azureblob

Insert into [dbo].[customer]
select *
from openjson ([dbo].[customer], '$.customer)
with (
	C_CUSTKEY int  '$.C_CUSTKEY',
	C_NAME varchar(25) '$.C_NAME',
	C_ADDRESS varchar(40) '$.C_ADDRESS',
	C_NATIONKEY int '$.C_NATIONKEY ',
	C_PHONE char(15) '$.C_PHONE',
	C_ACCTBAL decimal(15, 2) '$.C_ACCTBAL',
	C_MKTSEGMENT char(10) '$.C_MKTSEGMENT',
	C_COMMENT varchar(117) '$.C_COMMENT'
	)
go
