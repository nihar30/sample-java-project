INSERT INTO customer (id, name, surname, age, dateOfBirth)
 SELECT id, firstName, lastName, age, dateOfBirth 
 FROM OPENROWSET(BULK './user1.json',SINGLE_BLOB) JSON
 WITH (id int '$.id',
       firstName nvarchar(50)  '$.firstName', lastName nvarchar(50)  '$.lastName', 
       age int  '$.age', dateOfBirth datetime2   '$.dateOfBirth')
