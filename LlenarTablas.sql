/* Insertar datos de tablas temporales a tablas establecidas */
USE dataBanco;

/*--Llenar la tabla curreny--*/
INSERT INTO currency(
	description_currency
)
SELECT DISTINCT
	transaction_currency
FROM
	tmpTransaction;	
    
SELECT COUNT(*) currency;
SELECT * FROM currency;

/*--Llenar tabla location--*/
INSERT INTO location(
	type_code_location,
    type_name_country
)
SELECT
	location_type_code,
    location_type_name
FROM
	tmpLocation;
    
/*SELECT * FROM location;*/
SELECT COUNT(*) FROM location;

/*--Llenar tabla type_status--*/
INSERT INTO type_status(
    detalle_type_status
)
SELECT DISTINCT
	project_status
FROM
	tmpProject;
    
SELECT * FROM type_status;
SELECT COUNT(*) FROM type_status;

/*--Llenar tabla donors--*/
INSERT INTO donors(
	iso3_donors,
    name_donors
)
SELECT DISTINCT	
    project_donors_iso3,
    project_donors
FROM
	tmpProject;

SELECT * FROM donors;
SELECT COUNT(*) FROM donors;

/*--Llenar tabla country--*/
INSERT INTO country(
	name_country,
    iso2_country,
    aiddata_code_country,
    aiddata_name_country,
    cow_alpha_country,
    cow_numeric_country,
    fao_code_country,
    fips_country,
    geonames_id_country,
    imf_code_country,
    iso3_country,
    iso_numeric_country,
    oecd_code_country,
    un_code_country,
    wb_code_country
)
SELECT DISTINCT
	country_name,
    country_iso2,    
    country_name_aiddata_code,
    country_name_aiddata_name,
    country_name_cow_alpha,
    country_name_cow_numeric ,
    country_name_fao_code,    
    country_name_fips,
    country_name_geonames_id,
    country_name_imf_code,    
    country_name_iso3,
    country_name_iso_numeric,
    country_name_oecd_code,
    country_name_un_code,
    country_name_wb_code
FROM
	tmpCountryCodes;

SELECT * FROM country;
SELECT COUNT(*) FROM country;

/*--Llenar tabla geoname--*/
INSERT INTO geoname(
	id_geoname,
    name_geoname,
    latitude_geoname,
    longitude_geoname,
    location_id,
    gazetteer_adm_code_geoname,
    gazetteer_adm_name_geoname,
    location_class_geoname,
    geographic_exactness_geoname
)
SELECT
	geoname_id,
    geoname_plave_name,
    geoname_latitude,
    geoname_longitude,
    id_location,
    geoname_gazetter_adm_code,
    geoname_gazetter_adm_name,
    geoname_location_class,
    geoname_geographic_exactness 
FROM
	tmpGeonames,
    location
WHERE location.type_code_location = geoname_location_type_code;

/*SELECT * FROM geoname;*/
SELECT COUNT(*) FROM geoname;

/*--Llenar tabla project--*/
INSERT INTO project(
	id_code_project,
    is_geocoded_project,
    title_project,
    start_actual_isodate_project,
    end_actual_isodate_project,
    total_commitments_project,
    total_disbursments_project,    
    transaction_start_year_project,
    transaction_end_year_project,
    type_status_id_type_status,
    country_id_country,
    donors_id_donors,
    ad_sector_codes_project,
    ad_sector_names_project
)
SELECT 
	project_id,
    project_is_geocoded,
    project_title,
	project_start_actual_isodate,
    project_end_actual_isodate,    
    project_total_commitments,
    project_total_disbursements,
    project_transactions_start_year,
    project_transactions_end_year,
    id_type_status,       
    id_country,
    id_donors,
    project_ad_sector_codes,
    project_ad_sector_names         
FROM
	tmpProject,
    type_status,
    donors,
    country
WHERE type_status.detalle_type_status = project_status
AND donors.iso3_donors = project_donors_iso3
AND STRCMP(country.iso3_country,project_recipients_iso3) = 0;

/*SELECT * FROM project;*/
SELECT COUNT(*) FROM project;

/*
SELECT iso3_country, COUNT(*) FROM country
GROUP BY iso3_country
HAVING COUNT(*) > 1;

SELECT project_recipients_iso3, COUNT(*) FROM tmpProject
GROUP BY project_recipients_iso3
HAVING  COUNT(*) > 1;
*/

/*--Llenando tabla Transaction--*/
INSERT INTO tbl_transaction(
	id_name_transaction,
    project_id_project,
    iso_date_transaction,
    year_transaction,
    value_code_transaction,    
    value_transaction,
    currency_id_currency
)
SELECT
	transaction_id,
    id_project,
    transaction_isodate,
    transaction_year,
    transaction_value_code,    
    transaction_value,
    id_currency
FROM
	tmpTransaction,
    project,
    currency
WHERE project.id_code_project = transaction_project_id
AND currency.description_currency = transaction_currency;

/*SELECT * FROM tbl_transaction;*/
SELECT COUNT(*) FROM tbl_transaction;

/*--Llenando tabla  level_1a--*/
INSERT INTO level_1a(
	project_id_project,
    project_location_id_level_1a,
    id_geoname_level,
    transactions_start_year,
    transactions_end_year,
    even_split_commitments,
    even_split_disbursements
)
SELECT 
	id_project,
    level_project_location_id,
	level_geoname_id,
    level_transactions_start_year,
    level_transactions_end_year,
    level_even_split_commitments,
    level_even_split_disbursements
FROM
	tmpLevel1a,
    project
WHERE project.id_code_project = level_project_id;

/*SELECT * FROM level_1a;*/
SELECT COUNT(*) FROM level_1a;

SELECT id_geoname, COUNT(*) FROM geoname
GROUP BY id_geoname
HAVING COUNT(*) > 1;