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
    
SELECT * FROM location;
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
SELECT
	country_name,
    country_iso2,    
    country_name_aiddata_code,
    country_name_aiddata_name,
    country_name_cow_alpha,
    country_name_cow_numeric,
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

