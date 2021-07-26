declare  [customer]  nvarchar(max)
	 
select [customer] =
	BulkColumn
	from openrowset(bulk './user1.json', single_clob) JSON

