SELECT *
FROM OPENROWSET(BULK 'query/generated.json', DATA_SOURCE = 'MyAzureBlobStorage',
FORMATFILE='data/product.fmt', FORMATFILE_DATA_SOURCE = 'MyAzureBlobStorage') as data

CREATE EXTERNAL DATA SOURCE MyAzureBlobStorage
WITH ( TYPE = BLOB_STORAGE,
        LOCATION = 'https://myazureblobstorage.blob.core.windows.net',
        CREDENTIAL= MyAzureBlobStorageCredential);

