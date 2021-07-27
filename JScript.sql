CREATE EXTERNAL DATA SOURCE MyAzureBlobStorage
WITH ( TYPE = BLOB_STORAGE,
        LOCATION = 'https://sqlblobstorageaccount.blob.core.windows.net/query?sp=racwdl&st=2021-07-27T05:34:01Z&se=2021-07-27T13:34:01Z&spr=https&sv=2020-08-04&sr=c&sig=5Rr1RusIE%2FxmuH9h9JMfbA5atAaNASeSb3XOzuF7pQE%3D',
      );


SELECT *
FROM OPENROWSET(BULK 'query/generated.json', DATA_SOURCE = 'MyAzureBlobStorage') as data

