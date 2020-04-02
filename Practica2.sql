/* Crear base de datos y hacer drop de alguna existente con el mismo nombre */
DROP DATABASE IF EXISTS dataBanco;
CREATE DATABASE dataBanco;
USE dataBanco;

/* Crear tablas temporales para carga masiva */
CREATE TEMPORARY TABLE tmpCountryCodes(
	country_name nvarchar(300),
    country_iso2 varchar(100),
    country_name_name nvarchar(100),
    country_name_aiddata_code varchar(100),
    country_name_aiddata_name nvarchar(100),
    country_name_cow_alpha varchar(100),
    country_name_cow_numeric varchar(100),
    country_name_fao_code varchar(100),    
    country_name_fips varchar(100),
    country_name_geonames_id varchar(100),
    country_name_imf_code varchar(100),
    country_name_iso2 varchar(100),
    country_name_iso3 varchar(100),
    country_name_iso_numeric varchar(100),
    country_name_oecd_code varchar(100),
    country_name_oecd_name nvarchar(100),
    country_name_un_code varchar(100),
    country_name_wb_code varchar(100)
);

LOAD DATA INFILE '/home/luisarana/Escritorio/Archivos/Practica2/Practica2_MIA/ArchivosCSV/country_codes.tsv'
/*LOAD DATA INFILE '/home/luisarana/Escritorio/Archivos/MIA_P2_201700988/ArchivosCSV/country_codes.tsv'*/
INTO TABLE tmpCountryCodes
FIELDS TERMINATED BY '\t' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

/*SELECT * FROM tmpCountryCodes;*/
SELECT COUNT(*) FROM tmpCountryCodes;

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

LOAD DATA INFILE '/home/luisarana/Escritorio/Archivos/Practica2/Practica2_MIA/ArchivosCSV/geonames.csv'
/*LOAD DATA INFILE '/home/luisarana/Escritorio/Archivos/MIA_P2_201700988/ArchivosCSV/geonames.csv'*/
INTO TABLE tmpGeonames
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

/*SELECT * FROM tmpGeonames;*/
SELECT COUNT(*) FROM tmpGeonames;

CREATE TEMPORARY TABLE tmpLevel1a(
	level_project_id nvarchar(100),
    level_project_location_id nvarchar(100),
	level_geoname_id nvarchar(100),
    level_transactions_start_year nvarchar(100),
    level_transactions_end_year nvarchar(100),
    level_even_split_commitments nvarchar(100),
    level_even_split_disbursements nvarchar(100)
);

LOAD DATA INFILE '/home/luisarana/Escritorio/Archivos/Practica2/Practica2_MIA/ArchivosCSV/level_1a.csv'
/*LOAD DATA INFILE '/home/luisarana/Escritorio/Archivos/MIA_P2_201700988/ArchivosCSV/level_1a.csv'*/
INTO TABLE tmpLevel1a
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

/*SELECT * FROM tmpLevel1a;*/
SELECT COUNT(*) FROM tmpLevel1a;

CREATE TEMPORARY TABLE tmpLocation(
	location_type_code nvarchar(200),
    location_type_name nvarchar(100)    
);

LOAD DATA INFILE '/home/luisarana/Escritorio/Archivos/Practica2/Practica2_MIA/ArchivosCSV/locations.csv'
/*LOAD DATA INFILE '/home/luisarana/Escritorio/Archivos/MIA_P2_201700988/ArchivosCSV/locations.csv'*/
INTO TABLE tmpLocation
FIELDS TERMINATED BY '\t' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

/*SELECT * FROM tmpLocation*/
SELECT COUNT(*) FROM tmpLocation;

CREATE TEMPORARY TABLE tmpProject(
	project_id nvarchar(100),
    project_is_geocoded nvarchar(100),
    project_title nvarchar(300),
	project_start_actual_isodate nvarchar(100),
    project_end_actual_isodate nvarchar(100),
    project_donors nvarchar(100),
    project_donors_iso3 nvarchar(100),
    project_recipients nvarchar(100),
    project_recipients_iso3 nvarchar(100),
    project_ad_sector_codes nvarchar(100),
    project_ad_sector_names nvarchar(200),
    project_status nvarchar(100),
    project_transactions_start_year nvarchar(100),
    project_transactions_end_year nvarchar(100),
    project_total_commitments nvarchar(100),
    project_total_disbursements nvarchar(100)
);

LOAD DATA INFILE '/home/luisarana/Escritorio/Archivos/Practica2/Practica2_MIA/ArchivosCSV/projects.csv'
/*LOAD DATA INFILE '/home/luisarana/Escritorio/Archivos/MIA_P2_201700988/ArchivosCSV/projects.csv'*/
INTO TABLE tmpProject
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

/*SELECT * FROM tmpProject*/
SELECT COUNT(*) FROM tmpProject;

CREATE TEMPORARY TABLE tmpTransaction(
	transaction_id nvarchar(100),
    transaction_project_id nvarchar(100),
    transaction_isodate nvarchar(100),
    transaction_year nvarchar(100),
    transaction_value_code nvarchar(100),
    transaction_currency nvarchar(100),
    transaction_value nvarchar(100)
);

LOAD DATA INFILE '/home/luisarana/Escritorio/Archivos/Practica2/Practica2_MIA/ArchivosCSV/transactions.csv'
/*LOAD DATA INFILE '/home/luisarana/Escritorio/Archivos/MIA_P2_201700988/ArchivosCSV/transactions.csv'*/
INTO TABLE tmpTransaction
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

/*SELECT * FROM tmpTransaction*/
SELECT COUNT(*) FROM tmpTransaction;

/*Crear tablas*/

