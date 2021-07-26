declare  [dbo].[customer]  varchar(max)
	 
select [dbo].[customer] =
	BulkColumn
	from openrowset(bulk './user1.json', single_clob) JSON

