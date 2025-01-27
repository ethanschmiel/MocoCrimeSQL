-- Importing data -- 
DROP DATABASE IF EXISTS MocoCrime;
CREATE DATABASE MocoCrime;
USE MocoCrime;
DROP TABLE IF EXISTS moco_crime;
CREATE TABLE moco_crime (
    IncidentID INT,
    OffenceCode VARCHAR(10),
    CRNumber INT,
    DispatchDate VARCHAR(45),
    StartDate VARCHAR(45),
    EndDate VARCHAR(45),
    NBIRSCode VARCHAR(45),
    Victims INT,
    CrimeName1 VARCHAR(45),
    CrimeName2 VARCHAR(45),
    CrimeName3 VARCHAR(100),
    PoliceDistrict VARCHAR(45),
    BlockAddress VARCHAR(100),
    City VARCHAR(45),
    State VARCHAR(2),
    ZipCode VARCHAR(45),
    Agency VARCHAR(45),
    Place VARCHAR(45),
    Sector VARCHAR(45),
    Beat VARCHAR(45),
    PRA VARCHAR(45),
    AddressNum VARCHAR(45),
    StreetPrefix VARCHAR(10),
    StreetName VARCHAR(45),
    StreetSuffix VARCHAR(10),
    StreetType VARCHAR(45),
    Latitude DECIMAL(10,8),
    Longitude DECIMAL(11,8),
    PoliceDisNum VARCHAR(45),
    Location VARCHAR(100)
);    
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Crime2.csv' INTO TABLE moco_crime
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;
UPDATE moco_crime
SET 
    IncidentID = NULLIF(IncidentID, ''),
    OffenceCode = NULLIF(OffenceCode, ''),
    CRNumber = NULLIF(CRNumber, ''),
    DispatchDate = NULLIF(DispatchDate, ''),
    StartDate = NULLIF(StartDate, ''),
    EndDate = NULLIF(EndDate, ''),
    NBIRSCode = NULLIF(NBIRSCode, ''),
    Victims = NULLIF(Victims, ''),
    CrimeName1 = NULLIF(CrimeName1, ''),
    CrimeName2 = NULLIF(CrimeName2, ''),
    CrimeName3 = NULLIF(CrimeName3, ''),
    PoliceDistrict = NULLIF(PoliceDistrict, ''),
    BlockAddress = NULLIF(BlockAddress, ''),
    City = NULLIF(City, ''),
    State = NULLIF(State, ''),
    ZipCode = NULLIF(ZipCode, ''),
    Agency = NULLIF(Agency, ''),
    Place = NULLIF(Place, ''),
    Sector = NULLIF(Sector, ''),
    Beat = NULLIF(Beat, ''),
    PRA = NULLIF(PRA, ''),
    AddressNum = NULLIF(AddressNum, ''),
    StreetPrefix = NULLIF(StreetPrefix, ''),
    StreetName = NULLIF(StreetName, ''),
    StreetSuffix = NULLIF(StreetSuffix, ''),
    StreetType = NULLIF(StreetType, ''),
    Latitude =  CASE WHEN Latitude = 0 OR Latitude IS NULL THEN NULL ELSE Latitude END,
    Longitude = CASE WHEN Longitude = 0 OR Longitude IS NULL THEN NULL ELSE Longitude END,
    PoliceDisNum = NULLIF(PoliceDisNum, ''),
    Location = NULLIF(Location, '');

-- Cleaning Data --
-- Initialize Staging Table -- 
CREATE TABLE moco_crime_staging LIKE moco_crime;
INSERT moco_crime_staging SELECT * FROM moco_crime;
UPDATE moco_crime_staging
SET 
    IncidentID = NULLIF(IncidentID, ''),
    OffenceCode = NULLIF(OffenceCode, ''),
    CRNumber = NULLIF(CRNumber, ''),
    DispatchDate = NULLIF(DispatchDate, ''),
    StartDate = NULLIF(StartDate, ''),
    EndDate = NULLIF(EndDate, ''),
    NBIRSCode = NULLIF(NBIRSCode, ''),
    Victims = NULLIF(Victims, ''),
    CrimeName1 = NULLIF(CrimeName1, ''),
    CrimeName2 = NULLIF(CrimeName2, ''),
    CrimeName3 = NULLIF(CrimeName3, ''),
    PoliceDistrict = NULLIF(PoliceDistrict, ''),
    BlockAddress = NULLIF(BlockAddress, ''),
    City = NULLIF(City, ''),
    State = NULLIF(State, ''),
    ZipCode = NULLIF(ZipCode, ''),
    Agency = NULLIF(Agency, ''),
    Place = NULLIF(Place, ''),
    Sector = NULLIF(Sector, ''),
    Beat = NULLIF(Beat, ''),
    PRA = NULLIF(PRA, ''),
    AddressNum = NULLIF(AddressNum, ''),
    StreetPrefix = NULLIF(StreetPrefix, ''),
    StreetName = NULLIF(StreetName, ''),
    StreetSuffix = NULLIF(StreetSuffix, ''),
    StreetType = NULLIF(StreetType, ''),
    Latitude =  CASE WHEN Latitude = 0 OR Latitude IS NULL THEN NULL ELSE Latitude END,
    Longitude = CASE WHEN Longitude = 0 OR Longitude IS NULL THEN NULL ELSE Longitude END,
    PoliceDisNum = NULLIF(PoliceDisNum, ''),
    Location = NULLIF(Location, '');
    
-- 1. Removing duplicates --
WITH duplicate_cte AS (
	SELECT *, ROW_NUMBER() OVER (PARTITION by IncidentID,OffenceCode,CRNumber,StartDate) AS row_num FROM moco_crime_staging)
SELECT * 
FROM duplicate_cte 
WHERE row_num > 1;

CREATE TABLE `moco_crime_staging2` (
  `IncidentID` int DEFAULT NULL,
  `OffenceCode` varchar(45) DEFAULT NULL,
  `CRNumber` int DEFAULT NULL,
  `DispatchDate` varchar(45) DEFAULT NULL,
  `StartDate` varchar(45) DEFAULT NULL,
  `EndDate` varchar(45) DEFAULT NULL,
  `NBIRSCode` varchar(45) DEFAULT NULL,
  `Victims` int DEFAULT NULL,
  `CrimeName1` varchar(45) DEFAULT NULL,
  `CrimeName2` varchar(45) DEFAULT NULL,
  `CrimeName3` varchar(100) DEFAULT NULL,
  `PoliceDistrict` varchar(45) DEFAULT NULL,
  `BlockAddress` varchar(100) DEFAULT NULL,
  `City` varchar(45) DEFAULT NULL,
  `State` varchar(2) DEFAULT NULL,
  `ZipCode` varchar(45) DEFAULT NULL,
  `Agency` varchar(45) DEFAULT NULL,
  `Place` varchar(45) DEFAULT NULL,
  `Sector` varchar(45) DEFAULT NULL,
  `Beat` varchar(45) DEFAULT NULL,
  `PRA` varchar(45) DEFAULT NULL,
  `AddressNum` varchar(45) DEFAULT NULL,
  `StreetPrefix` varchar(10) DEFAULT NULL,
  `StreetName` varchar(45) DEFAULT NULL,
  `StreetSuffix` varchar(10) DEFAULT NULL,
  `StreetType` varchar(45) DEFAULT NULL,
  `Latitude` decimal(10,8) DEFAULT NULL,
  `Longitude` decimal(11,8) DEFAULT NULL,
  `PoliceDisNum` varchar(45) DEFAULT NULL,
  `Location` varchar(100) DEFAULT NULL,
  `row_num` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

SELECT * FROM moco_crime_staging2 WHERE row_num > 1;
INSERT INTO moco_crime_staging2
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY IncidentID,OffenceCode,CRNumber,StartDate) AS row_num FROM moco_crime_staging;

DELETE FROM moco_crime_staging2 WHERE row_num > 1;

-- 2. Changing data types -- 
UPDATE moco_crime_staging
SET PRA = NULL WHERE PRA = 'Unknown';
ALTER TABLE moco_crime_staging
MODIFY COLUMN StartDate date,
MODIFY COLUMN DispatchDate date,
MODIFY COLUMN EndDate date,
MODIFY COLUMN OffenceCode int,
MODIFY COLUMN ZipCode int;

-- 3. Removing incomplete data --
DELETE FROM moco_crime_staging WHERE ZipCode IS NULL;
DELETE FROM moco_crime_staging WHERE Location IS NULL;
DELETE FROM moco_crime_staging WHERE StreetName IS NULL;
DELETE FROM moco_crime_staging WHERE FullAddress = ' ';
delete from moco_crime_staging where offencecode IS NULL;
DELETE FROM moco_crime_staging WHERE Latitude IS NULL;
DELETE FROM moco_crime_staging WHERE Longitude IS NULL;
-- 4. Adding/Removing Columns -- 
ALTER TABLE moco_crime_staging
DROP COLUMN Location;
ALTER TABLE moco_crime_staging ADD FullAddress VARCHAR(255);
UPDATE moco_crime_staging
SET FullAddress = TRIM(CONCAT(
	COALESCE(AddressNum, ''), ' ',
    COALESCE(StreetPrefix, ''), ' ',
    COALESCE(StreetName, ''), ' ',
    COALESCE(StreetSuffix, ''), ' ',
    COALESCE(StreetType, '')
));
alter table moco_crime_staging
drop column AddressNum,
drop column StreetPrefix,
drop column StreetType,
drop column StreetSuffix,
drop column StreetName,
drop column EndDate,
drop column DispatchDate,
drop column State;

DELETE FROM moco_crime_staging WHERE Beat IS NULL;

delete from moco_crime_staging where BlockAddress is NULL;

-- #5 Fixing City Names -- 
delete from moco_crime_staging where city = '1';
delete from moco_crime_staging where city = '20877';
delete from moco_crime_staging where city = '3';
delete from moco_crime_staging where city = '4';
delete from moco_crime_staging where city = '6';
delete from moco_crime_staging where city = '7';

UPDATE moco_crime_staging SET City = 'BETHESDA' WHERE City IN ('BEHESDA', 'BEHTESDA', 'BETEHSDA', 'BETESDA', 'BETHEDA', 'BETHESA', 'BETHESDAS', 'BETHSDA');
UPDATE moco_crime_staging SET City = 'SPENCERVILLE' WHERE City = 'APENCERVILLE';
UPDATE moco_crime_staging SET City = 'ASHTON' WHERE City = 'ASHTON';
UPDATE moco_crime_staging SET City = 'ASPEN HILL' WHERE City = 'ASPEN HILL';
UPDATE moco_crime_staging SET City = 'BALTIMORE' WHERE City = 'BALTIMORE';
UPDATE moco_crime_staging SET City = 'BARNESVILLE' WHERE City IN ('BARNESVIILE', 'BARNESVILLE');
UPDATE moco_crime_staging SET City = 'BEALLSVILLE' WHERE City = 'BEALLSVILLE';
UPDATE moco_crime_staging SET City = 'BETHESDA' WHERE City IN ('BEHESDA', 'BEHTESDA', 'BETEHSDA', 'BETESDA', 'BETHEDA', 'BETHESA', 'BETHESDAS', 'BETHSDA');
UPDATE moco_crime_staging SET City = 'BELTSVILLE' WHERE City = 'BELTSVILLE';
UPDATE moco_crime_staging SET City = 'BOYDS' WHERE City = 'BOYDS';
UPDATE moco_crime_staging SET City = 'BRINKLOW' WHERE City = 'BRINKLOW';
UPDATE moco_crime_staging SET City = 'BROOKEVILLE' WHERE City = 'BROOKEVILLE';
UPDATE moco_crime_staging SET City = 'BURTONSVILLE' WHERE City IN ('BURTONSVILE', 'BURTOSNVILLE', 'BURTSONVILLE', 'BUTINSVILLE');
UPDATE moco_crime_staging SET City = 'CABIN JOHN' WHERE City = 'CABIN JOHN';
UPDATE moco_crime_staging SET City = 'CLARKSBURG' WHERE City IN ('CALARKSBURG', 'CLARKESBURG', 'CLARKSURG', 'CLARSKBURG');
UPDATE moco_crime_staging SET City = 'CHEVY CHASE' WHERE City IN ('CEHVY CHASE', 'CERWOOD', 'CHEVY CAHSE', 'CHEVY CHASE #3', 'CHEVY CHASE #4', 'CHEVY CHASE VIEW', 'CHEVY CHASE VILLAGE', 'CHEY CHASE', 'CHVEY CHASE');
UPDATE moco_crime_staging SET City = 'COLESVILLE' WHERE City = 'COLESVILLE';
UPDATE moco_crime_staging SET City = 'DAMASCUS' WHERE City IN ('DANASCUS');
UPDATE moco_crime_staging SET City = 'DARNESTOWN' WHERE City = 'DARNESTOWN';
UPDATE moco_crime_staging SET City = 'DERWOOD' WHERE City IN ('DEROOD');
UPDATE moco_crime_staging SET City = 'DICKERSON' WHERE City = 'DICKERSON';
UPDATE moco_crime_staging SET City = 'FOREST HEIGHTS' WHERE City = 'FOREST HEIGHTS';
UPDATE moco_crime_staging SET City = 'FRIENDSHIP HEIGHTS' WHERE City IN ('FRIENDHSIP HEIGHTS');
UPDATE moco_crime_staging SET City = 'GAITHERSBURG' WHERE City IN ('GA', 'GAIHERSBURG', 'GAISTHERSBURG', 'GAITEHRSBURG', 'GAITERSBURG', 'GAITHERBSURG', 'GAITHERBURG', 'GAITHERESBURG', 'GAITHERSBRG', 'GAITHERSBRUG', 'GAITHERSBUG', 'GAITHERSBURB', 'GAITHERSBURD', 'GAITHERSBURG`', 'GAITHERSBURGQ', 'GAITHERSBURRG', 'GAITHERSBURT', 'GAITHERSBYRG', 'GAITHERSGURG', 'GAITHERSRBURG', 'GAITHERSURG', 'GAITHESBURG', 'GAITHESRBURG', 'GAITHRESBURG', 'GATHERSBURG', 'GATIHERSBURG', 'GIATHERSBURG', 'GITHERSBURG');
UPDATE moco_crime_staging SET City = 'GARRETT PARK' WHERE City IN ('GARETT PARK');
UPDATE moco_crime_staging SET City = 'GERMANTOWN' WHERE City IN ('GEERMANTOWN', 'GEMANTOWN', 'GERANTOWN', 'GERMAN4TOWN', 'GERMANOTWN', 'GERMANTIWN', 'GERMANTNOWN', 'GERMANTOEN', 'GERMANTONW', 'GERMANTOOWN', 'GERMANTOW', 'GERMANTOWM', 'GERMANTOWNN', 'GERMANTWON', 'GERMATOWN', 'GERMNATOWN', 'GERMNTOWN', 'GERRMANTOWN');
UPDATE moco_crime_staging SET City = 'GLEN ECHO' WHERE City IN ('GLEN ECHO`');
UPDATE moco_crime_staging SET City = 'GLENMONT' WHERE City = 'GLENMONT';
UPDATE moco_crime_staging SET City = 'HIGHLAND' WHERE City = 'HIGHLAND';
UPDATE moco_crime_staging SET City = 'HYATTSVILLE' WHERE City IN ('HYATTSTOWN');
UPDATE moco_crime_staging SET City = 'KENNSINGTON' WHERE City IN ('KENSIGNTON', 'KENSINGTON', 'KENSINGTOWN', 'KENSINNGTON', 'KENSONGTON');
UPDATE moco_crime_staging SET City = 'LAYTONSVILLE' WHERE City IN ('LATONSVILLE', 'LAYTENSVILLE');
UPDATE moco_crime_staging SET City = 'MONTGOMERY VILLAGE' WHERE City IN ('MOMTGOMERY VILLAGE', 'MONGTOMERY VILLAGE', 'MONT VILLAGE', 'MONTGGOMERY VILLAGE', 'MONTGOMERY', 'MONTGOMERY COUNTY', 'MONTGOMERY VILAGE', 'MONTGOMERY VILLAE', 'MONTGOMERY VILLLAGE', 'MONTGOMRY VILLAGE', 'MONTHOMERY VILLAGE', 'MONTOMGERY VILLAGE', 'MOTGOMERY VILLAGE');
UPDATE moco_crime_staging SET City = 'NORTH BETHESDA' WHERE City IN ('N BETHESDA', 'N. BETHESDA', 'NORTH BEHTESDA', 'NORTH BETHSDA');
UPDATE moco_crime_staging SET City = 'NORTH POTOMAC' WHERE City IN ('N POTOMAC', 'N. POTOMAC', 'NORTH POTOAMC', 'NOTRTH POTOMAC');
UPDATE moco_crime_staging SET City = 'ROCKVILLE' WHERE City IN ('ROCK VILLE', 'ROCKILLE', 'ROCKIVILLE', 'ROCKIVLLE', 'ROCKVIILE', 'ROCKVIILLE', 'ROCKVILE', 'ROCKVILEE', 'ROCKVILL', 'ROCKVILLLE', 'ROCKVLLE', 'ROCVILLE', 'ROCVKILLE', 'ROKVILLE', 'ROOCKVILLE');
UPDATE moco_crime_staging SET City = 'SILVER SPRING' WHERE City IN ('SILER SPRING', 'SILV ER SPRING', 'SILVE SPRING', 'SILVE4R SPRING', 'SILVER  SPRING', 'SILVER SPING', 'SILVER SPIRNG', 'SILVER SPRIG', 'SILVER SPRIN', 'SILVER SPRIND', 'SILVER SPRING`', 'SILVER SPRINGQ', 'SILVER SPRNG', 'SILVER SPRNIG', 'SILVER SRING', 'SILVER SRPING', 'SILVER SRRING', 'SILVERSPRING', 'SILVR SPRING', 'SIVER SPRING', 'SIVLER SPRING', 'SLVER SPRING');
UPDATE moco_crime_staging SET City = 'TAKOMA PARK' WHERE City IN ('TACOMA PARK', 'TAKOMS PARK');
UPDATE moco_crime_staging SET City = 'WASHINGTON' WHERE City = 'WASHINGTON';
UPDATE moco_crime_staging SET City = 'WASHINGTON GROVE' WHERE City = 'WASHINGTON GROVE';
UPDATE moco_crime_staging SET City = 'WHEATON' WHERE City = 'WHEATON';
UPDATE moco_crime_staging SET City = 'WOODBINE' WHERE City = 'WOODBINE';

delete from moco_crime_staging where ZipCode not in (
	20812, 20813, 20814, 20815, 20816, 20817, 20818, 20824, 20825, 20827, 
    20830, 20832, 20833, 20837, 20838, 20839, 20841, 20842, 20847, 20848, 
    20849, 20850, 20851, 20852, 20853, 20854, 20855, 20859, 20860, 20861, 
    20862, 20866, 20868, 20871, 20872, 20874, 20875, 20876, 20877, 20878, 
    20879, 20880, 20882, 20883, 20884, 20885, 20886, 20891, 20895, 20896, 
    20898, 20901, 20902, 20903, 20904, 20905, 20906, 20907, 20908, 20910, 
    20911, 20912, 20913, 20914, 20915, 20916, 20918
);

USE mococrime;
select * from moco_crime_staging
into outfile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/CleanedUpData2.csv'
FIELDS TERMINATED BY ',' ENCLOSED BY '"' 
LINES TERMINATED BY '\n';

select * from moco_crime_staging;



