USE dataBanco;

CREATE TEMPORARY TABLE tmpLocation(
	location_type_code nvarchar(200),
    location_type_name nvarchar(100)    
);

LOAD DATA INFILE '/home/luisarana/Escritorio/Archivos/MIA_P2_201700988/ArchivosCSV/locations.csv'
INTO TABLE tmpLocation
FIELDS TERMINATED BY '\t' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

/*SELECT * FROM tmpLocation*/
SELECT COUNT(*) FROM tmpLocation;
