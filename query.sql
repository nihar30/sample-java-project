select  [dbo].[customer]  nvarchar(max)
	 
from 
	openrowset(bulk './user1.json', single_clob) JSON
go

