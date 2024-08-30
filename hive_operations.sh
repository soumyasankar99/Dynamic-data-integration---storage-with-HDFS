# hive_operations.sh

#!/bin/bash

# Define variables
HIVE_DB="population_db"
HIVE_TABLE="p_data"
HDFS_FILE_PATH="/user/hadoop/population_data/sub-est2021_1.csv"

# Step 1: Create a Hive database
hive -e "CREATE DATABASE IF NOT EXISTS $HIVE_DB;"

# Step 2: Create a Hive table based on the CSV file structure
hive -e "
USE $HIVE_DB;
CREATE TABLE IF NOT EXISTS $HIVE_TABLE (
    SUMLEV INT,
    STATE INT,
    COUNTY INT,
    PLACE INT,
    COUSUB INT,
    CONCIT INT,
    PRIMGEO_FLAG INT,
    PFUNCSTAT STRING,
    NAME STRING,
    STNAME STRING,
    ESTIMATESBASE2020 INT,
    POPESTIMATE2020 INT,
    POPESTIMATE2021 INT

)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE;"

# Step 3: Load data from HDFS into the Hive table
hive -e "USE $HIVE_DB; LOAD DATA INPATH '$HDFS_FILE_PATH' INTO TABLE $HIVE_TABLE;"

# Step 4: Query the Hive table to verify the data
hive -e "USE $HIVE_DB; SELECT * FROM $HIVE_TABLE LIMIT 10;"