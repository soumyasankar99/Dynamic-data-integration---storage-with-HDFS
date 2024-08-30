

#!/bin/bash

# Define variables
LOCAL_FILE="sub-est2021_1.csv"
HDFS_DIR="/user/hadoop/population_data"

# Step 1: Ensure Hadoop is running
# Uncomment the lines below if Hadoop is not running
# start-dfs.sh
# start-yarn.sh

# Step 2: Create a directory in HDFS
hadoop fs -mkdir -p $HDFS_DIR

# Step 3: Upload the CSV file to HDFS
hadoop fs -put $LOCAL_FILE $HDFS_DIR

# Step 4: Verify that the file has been stored in HDFS
hadoop fs -ls $HDFS_DIR

echo "CSV file has been successfully uploaded to HDFS at $HDFS_DIR"
