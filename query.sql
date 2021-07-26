SELECT *
FROM OPENJSON(@json)
     WITH (id int, firstName nvarchar(50), lastName nvarchar(50),
           age int, dateOfBirth datetime2)
