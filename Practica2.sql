/* Crear base de datos y hacer drop de alguna existente con el mismo nombre */
DROP DATABASE IF EXISTS dataBanco;
CREATE DATABASE dataBanco;
USE dataBanco;

/* Crear tablas temporales para carga masiva */
CREATE TEMPORARY TABLE tmpCountryCodes(
	nameCountry nvarchar(100),
    iso2 varchar(2),
    nameName nvarchar(100),
    aidDataCode int,
    aidDataName nvarchar(100),
    cowAlpha varchar(3),
    cowNumeric varchar(3),
    faoCode varchar(3),
    nameTips varchar(2),
    geoNamesId int,
    imfCode varchar(3),
    nameIso2 varchar(2),
    nameIso3 varchar(3),
    isoNumeric varchar(3),
    oecdCode varchar(3),
    oecdName nvarchar(100),
    unCodeName varchar(3),
    wbCodeName varchar(3)
);

LOAD DATA INFILE '/home/luisarana/Escritorio/Archivos/MIA_P2_201700988/ArchivosCSV/country_codes.tsv'
INTO TABLE tmpCountryCodes
FIELDS TERMINATED BY ' '
LINES TERMINATED BY '\n'
(nameCountry, iso2, nameName, aidDataCode, aidDataName, cowAlpha, cowNumeric,
faoCode, nameTips, geoNamesId, imfCode, isoNumeric, oecdCode, oecdName,
unCodeName, wbCodeName);