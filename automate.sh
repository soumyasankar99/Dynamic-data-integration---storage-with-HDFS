#!/bin/bash

# Define variables
LOCAL_FILE="sub-est2021_1.csv"
HDFS_DIR="/user/hadoop/population_data"
HIVE_DB="population_db"
HIVE_TABLE="p_data"
HDFS_FILE_PATH="$HDFS_DIR/$LOCAL_FILE"

# Step 1: Ensure Hadoop and Hive are running 


# Step 2: Upload the CSV file to HDFS
echo "Uploading CSV file to HDFS..."
hadoop fs -mkdir -p $HDFS_DIR
hadoop fs -put $LOCAL_FILE $HDFS_DIR

# Verify that the file has been stored in HDFS
hadoop fs -ls $HDFS_DIR

echo "CSV file has been successfully uploaded to HDFS at $HDFS_DIR"

# Step 3: Create Hive database and table, and load the data
echo "Creating Hive database and table..."
hive -e "CREATE DATABASE IF NOT EXISTS $HIVE_DB;"
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

echo "Loading data into Hive table..."
hive -e "USE $HIVE_DB; LOAD DATA INPATH '$HDFS_FILE_PATH' INTO TABLE $HIVE_TABLE;"

# Step 4: Query the Hive table to verify the data
echo "Querying Hive table..."
hive -e "USE $HIVE_DB; SELECT * FROM $HIVE_TABLE LIMIT 10;"

echo "Process completed successfully."
