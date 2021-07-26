declare  [customer]  varchar(max)
	 
select [customer] =
	BulkColumn
	from openrowset(bulk './user1.json', single_clob) JSON

