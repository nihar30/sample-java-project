Drop table books;
Create table books( Id NCHAR(14), [Name] NCHAR(15), Author NCHAR(15) )
SELECT id,[name],author FROM OPENROWSET(
    BULK  'books.json',
    DATA_SOURCE = 'MyAzureBlobStorage22',
     SINGLE_CLOB
     ) AS DataFile
 CROSS APPLY OPENJSON(BulkColumn)
 WITH (id NCHAR(14),
 [name] NCHAR(15),
 author NCHAR(15)) as book
INSERT INTO books with (TABLOCK) (id,[name],author)
 SELECT id,[name],author FROM OPENROWSET(
    BULK  'books.json',
    DATA_SOURCE = 'MyAzureBlobStorage22',
     SINGLE_CLOB
     ) AS DataFile
 CROSS APPLY OPENJSON(BulkColumn)
 WITH (id NCHAR(14),
 [name] NCHAR(15),
 author NCHAR(15)) as book
