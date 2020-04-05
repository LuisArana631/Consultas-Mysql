USE dataBanco;

/*Crear tablas*/
CREATE TABLE currency(
	id_currency integer auto_increment,
    description_currency nvarchar(50),
    PRIMARY KEY (id_currency)
);

CREATE TABLE donors(
	id_donors integer auto_increment,
    iso3_donors nvarchar(10),
    name_donors nvarchar(100),
    PRIMARY KEY (id_donors)
);

CREATE TABLE country(
	id_country integer auto_increment,
    name_country nvarchar(300),
    iso2_country nvarchar(15),
    aiddata_code_country nvarchar(20),
    aiddata_name_country nvarchar(100),
    cow_alpha_country nvarchar(15),
    cow_numeric_country nvarchar(20),  
    fao_code_country nvarchar(20),
    fips_country nvarchar(15),
    geonames_id_country nvarchar(20),
    imf_code_country nvarchar(20),
    iso3_country nvarchar(20),
    iso_numeric_country nvarchar(20),
    oecd_code_country nvarchar(20),
    un_code_country nvarchar(20),
    wb_code_country nvarchar(20),
    PRIMARY KEY (id_country)
);

CREATE TABLE location(
	id_location integer auto_increment,
    type_code_location nvarchar(15),
    type_name_country nvarchar(100),
    PRIMARY KEY (id_location)
);

CREATE TABLE type_status(
	id_type_status integer auto_increment,
    detalle_type_status nvarchar(50),
    PRIMARY KEY (id_type_status)
);

CREATE TABLE project(
	id_project integer auto_increment,
    id_code_project nvarchar(50),
    is_geocoded_project integer,
    title_project nvarchar(200),
    start_actual_isodate_project nvarchar(30),
    end_actual_isodate_project nvarchar(30),
    total_commitments_project nvarchar(100),
    total_disbursments_project nvarchar(100),    
    transaction_start_year_project integer,
    transaction_end_year_project integer,
    type_status_id_type_status integer,
    country_id_country integer,
    donors_id_donors integer,
    ad_sector_codes_project nvarchar(100),
    ad_sector_names_project nvarchar(200),
    PRIMARY KEY (id_project),
    CONSTRAINT fk_type_status FOREIGN KEY (type_status_id_type_status) REFERENCES type_status(id_type_status),
	CONSTRAINT fk_country_id FOREIGN KEY (country_id_country) REFERENCES country(id_country),
    CONSTRAINT fk_donors_id FOREIGN KEY (donors_id_donors) REFERENCES donors(id_donors)
);

CREATE TABLE geoname(
	id_num integer auto_increment,
	id_geoname integer,
    name_geoname nvarchar(100),
    latitude_geoname float,
    longitude_geoname float,
    location_id integer,
    gazetteer_adm_code_geoname nvarchar(100),
    gazetteer_adm_name_geoname nvarchar(200),
    location_class_geoname integer,
    geographic_exactness_geoname integer,
    PRIMARY KEY (id_num),
    CONSTRAINT fk_location_id FOREIGN KEY (location_id) REFERENCES location(id_location)
);

CREATE TABLE level_1a(
	project_id_project integer,
    project_location_id_level_1a nvarchar(100),
    id_geoname_level integer,
    transactions_start_year integer,
    transactions_end_year integer,
    even_split_commitments nvarchar(100),
    even_split_disbursements nvarchar(100),
    CONSTRAINT fk_project_id FOREIGN KEY (project_id_project) REFERENCES project(id_project)
);

CREATE TABLE tbl_transaction(
	id_transaction integer auto_increment,
    id_name_transaction nvarchar(100),
    project_id_project integer,
    iso_date_transaction nvarchar(50),
    year_transaction integer,
    value_code_transaction nvarchar(20),    
    value_transaction nvarchar(100),
    currency_id_currency integer,
    PRIMARY KEY (id_transaction),
    CONSTRAINT fk_project_id_tbl FOREIGN KEY (project_id_project) REFERENCES project(id_project),
    CONSTRAINT fk_currency_id FOREIGN KEY (currency_id_currency) REFERENCES currency(id_currency)
);





