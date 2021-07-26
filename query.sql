
select 
	cast(bulkcolumn as nvarchar(max)) as jsondata 
from 
	openrowset(bulk 'import-demo/user1.json', data_source = 'dmstore2_misc', single_clob) as azureblob
go

-- Read and access the content of the JSON file
with cte as 
(
	select 
		cast(bulkcolumn as nvarchar(max)) as jsondata 
	from 
		openrowset(bulk 'import-demo/user1.json', data_source = 'dmstore2_misc', single_clob) as azureblob
)
select
	j.*
from
	cte
cross apply 
	openjson(cte.jsondata) j
go

-- Read and access the content of the JSON file, with schema-on-read
with cte as 
(
	select 
		cast(bulkcolumn as nvarchar(max)) as jsondata 
	from 
		openrowset(bulk 'import-demo/user1.json', data_source = 'dmstore2_misc', single_clob) as azureblob
)
select
	j.*
from
	cte
cross apply 
	openjson(cte.jsondata) with
	(
		firstName nvarchar(50),
		lastName nvarchar(50),
		isAlive bit,
		age int,
		[address] nvarchar(max) as json,
		phoneNumbers nvarchar(max) as json
	) j
go

-- What if source is a list of json rows?
with cte as
(
select 
	cast(bulkcolumn as nvarchar(max)) as jsondata 
from 
	openrowset(bulk 'import-demo/users.json', data_source = 'dmstore2_misc', single_clob) as azureblob
)
select
	s.[value] as jsonrow
from
	cte c
cross apply
	string_split(c.jsondata, char(10)) s
where
	replace(s.[value], char(13), '') <> ''
go
