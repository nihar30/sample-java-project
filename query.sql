INSERT INTO customer (id, name, surname, age, dateOfBirth)
 SELECT id, firstNAme, lastName, age, dateOfBirth 
 FROM OPENJSON(BULK './user1.json',SINGLE_BLOB)
 WITH (id int,
       firstName nvarchar(50), lastName nvarchar(50), 
       age int, dateOfBirth datetime2)
