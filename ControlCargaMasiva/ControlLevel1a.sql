USE dataBanco;

CREATE TEMPORARY TABLE tmpLevel1a(
	level_project_id nvarchar(100),
    level_project_location_id nvarchar(100),
	level_geoname_id nvarchar(100),
    level_transactions_start_year nvarchar(100),
    level_transactions_end_year nvarchar(100),
    level_even_split_commitments nvarchar(100),
    level_even_split_disbursements nvarchar(100)
);

LOAD DATA INFILE '/home/luisarana/Escritorio/Archivos/MIA_P2_201700988/ArchivosCSV/level_1a.csv'
INTO TABLE tmpLevel1a
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

/*SELECT * FROM tmpLevel1a;*/
SELECT COUNT(*) FROM tmpLevel1a;
