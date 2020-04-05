USE dataBanco;

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

LOAD DATA INFILE '/home/luisarana/Escritorio/Archivos/MIA_P2_201700988/ArchivosCSV/projects.csv'
INTO TABLE tmpProject
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

/*SELECT * FROM tmpProject;*/
SELECT COUNT(*) FROM tmpProject;