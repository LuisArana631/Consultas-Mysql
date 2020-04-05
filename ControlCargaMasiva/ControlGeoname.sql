USE dataBanco;

CREATE TEMPORARY TABLE tmpGeonames(
	geoname_id nvarchar(100),
    geoname_plave_name nvarchar(100),
    geoname_latitude nvarchar(100),
    geoname_longitude nvarchar(100),
    geoname_location_type_code nvarchar(100),
    geoname_location_type_name nvarchar(100),
    geoname_gazetter_adm_code nvarchar(100),
    geoname_gazetter_adm_name nvarchar(200),
    geoname_location_class nvarchar(100),
    geoname_geographic_exactness nvarchar(100) 
);

LOAD DATA INFILE '/home/luisarana/Escritorio/Archivos/MIA_P2_201700988/ArchivosCSV/geonames.csv'
INTO TABLE tmpGeonames
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

/*SELECT * FROM tmpGeonames;*/
SELECT COUNT(*) FROM tmpGeonames;
