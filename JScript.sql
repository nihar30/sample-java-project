
drop DATABASE SCOPED CREDENTIAL MyAzureBlobStorageCredential
drop  EXTERNAL DATA SOURCE MyAzureBlobStorage

go
print 'Creating credential'
CREATE DATABASE SCOPED CREDENTIAL MyAzureBlobStorageCredential
WITH IDENTITY = 'SHARED ACCESS SIGNATURE',
SECRET = 'drop DATABASE SCOPED CREDENTIAL MyAzureBlobStorageCredential
drop  EXTERNAL DATA SOURCE MyAzureBlobStorage

go
-- Create Storage Credential
print 'Creating credential'
CREATE DATABASE SCOPED CREDENTIAL MyAzureBlobStorageCredential
WITH IDENTITY = 'SHARED ACCESS SIGNATURE',
SECRET = 'sv=2016-05-31&ss=bfqt&srt=sco&sp=rwdlacup&se=2017-05-08T23:03:46Z&st=2017-05-08T15:03:46Z&spr=https&sig=nxxxUJXfp%2BL23%2FULs2wY3%2BYAdFewzNsqp73rcsSoge4%3D';

SELECT *
FROM OPENROWSET(BULK 'query/generated.json', DATA_SOURCE = 'MyAzureBlobStorage',
FORMATFILE='data/product.fmt', FORMATFILE_DATA_SOURCE = 'MyAzureBlobStorage') as data

CREATE EXTERNAL DATA SOURCE MyAzureBlobStorage
WITH ( TYPE = BLOB_STORAGE,
        LOCATION = 'https://myazureblobstorage.blob.core.windows.net',
        CREDENTIAL= MyAzureBlobStorageCredential);

