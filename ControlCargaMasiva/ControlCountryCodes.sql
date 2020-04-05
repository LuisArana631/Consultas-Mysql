USE dataBanco;

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

LOAD DATA INFILE '/home/luisarana/Escritorio/Archivos/MIA_P2_201700988/ArchivosCSV/country_codes.tsv'
IGNORE INTO TABLE tmpCountryCodes
FIELDS TERMINATED BY '\t' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

/*SELECT * FROM tmpCountryCodes;*/
SELECT COUNT(*) FROM tmpCountryCodes;