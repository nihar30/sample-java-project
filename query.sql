DECLARE @JSON VARCHAR(MAX)
SELECT @JSON = BulkColumn
FROM OPENROWSET(BULK'C:\Users\pulipati.vedanth\Downloads\generated.json',SINGLE_BLOB) As J
SELECT Name,Gender,Company,Email into EmployeeDetails
FROM OPENJSON(@JSON,'$.data')
WITH (name varchar(100) ,
       Gender varchar(100) ,
	 Company varchar(100) , 
       Email Varchar (100)
	 )
