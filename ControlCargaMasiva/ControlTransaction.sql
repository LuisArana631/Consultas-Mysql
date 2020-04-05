USE dataBanco;

CREATE TEMPORARY TABLE tmpTransaction(
	transaction_id nvarchar(100),
    transaction_project_id nvarchar(100),
    transaction_isodate nvarchar(100),
    transaction_year nvarchar(100),
    transaction_value_code nvarchar(100),
    transaction_currency nvarchar(100),
    transaction_value nvarchar(100)
);

LOAD DATA INFILE '/home/luisarana/Escritorio/Archivos/MIA_P2_201700988/ArchivosCSV/transactions.csv'
INTO TABLE tmpTransaction
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

/*SELECT * FROM tmpTransaction*/
SELECT COUNT(*) FROM tmpTransaction;
