

use mydb;



LOAD DATA INFILE '/Users/schou/Desktop/BostonCrimeDatabase/database/incidents_cleaned_v3/incidents_cleaned_v3_pt_1.csv' INTO TABLE incident
  FIELDS TERMINATED BY ',' ENCLOSED BY '"'
  LINES TERMINATED BY '\r\n'
  IGNORE 1 LINES;
  
LOAD DATA INFILE '/Users/schou/Desktop/BostonCrimeDatabase/database/incidents_cleaned_v3/incidents_cleaned_v3_pt2.csv' INTO TABLE incident
  FIELDS TERMINATED BY ',' ENCLOSED BY '"'
  LINES TERMINATED BY '\r\n'
  IGNORE 1 LINES;
  
LOAD DATA INFILE '/Users/schou/Desktop/BostonCrimeDatabase/database/incident_offence_cleaned.csv' INTO TABLE incident_offence
  CHARACTER SET latin1
  FIELDS TERMINATED BY ',' ENCLOSED BY '"'
  LINES TERMINATED BY '\r\n'
  IGNORE 1 LINES;
  
  SHOW VARIABLES LIKE "secure_file_priv";