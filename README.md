# Dynamic Data Ingestion and Storage in HDFS with Automated Hive Integration
Overview:
--------
This project demonstrates the process of ingesting a CSV file into Hadoop's HDFS and then using Apache Hive to create a database and table, load the CSV data, and query it. The project is organized into two main scripts:
 
1) Hadoop Bash Script: This script uploads a CSV file from the local file system to HDFS.
2) HiveQL Bash Script: This script creates a Hive database, loads the CSV data into a table, and then runs a query to verify the data.

Project Structure:
-----------------

- save_to_hdfs.sh        # Script to upload CSV data to HDFS
- hive_operations.sh     # Script to create Hive database and table, load data, and query it
- population_data.csv    # Example CSV file (you can replace with your actual data file)

Prerequisites:
-------------
1) We can achieve this by to way:
   a) By installing and configuring Hadoop and Hive Locally through VMs
   or
   b) By Using DevBox : https://github.com/nethajinirmal13/DataFusion-DevBox
   (Deploy DevBox in AWS EC2 with the help of Docker to Implement everythin in Hadoop on Web)

3) Hadoop services (HDFS and YARN) must be running.
4) The population_data.csv file should be in the same directory as the scripts or specify the correct path in the save_to_hdfs.sh script.

More about DataFusion-DevBox :
------------------------------


<img width="784" alt="HDFS-DEVBOX" src="https://github.com/user-attachments/assets/b997ba79-8c36-4140-b640-76ee9947954d">


This all-in-one Docker environment has everything you need to master Hadoop, Spark, Hive, HBase, Kafka, and more—all from the comfort 
of a browser-based CodeServer.
No more bulky VM setups or storage headaches! 😅

DevBox uses the concept of Codespace in a way and Docker to fully utilised to spin of the Hadoop system on the web to give up the full power to do Projects at will. No need for any other package installation just typed the command on the terminal and everything will taken care by DevBox. 

For the projects perspective you will have a hassel free experience as everythingis pre-installed you just have to Execute on terminal and if you stuck at some point go for the official document of that perticular service . Its uses the Documet commands nothing here is 3rd party. 

For more on How to implement Devbox on AWS EC2 and execute all Hadoop Ecosystem related projects go refers to this LinkedIn post that i have been created.  

Link 🔗: https://www.linkedin.com/pulse/devbox-ec2-virtual-machine-all-one-hadoop-ecosystem-web-panda-3jflc/?trackingId=Zw8pGGNaTf6RtXwetPdG%2Bw%3D%3D

### Implementation steps:
-------------------------

### Upload CSV Data to HDFS :

To upload the CSV data into HDFS make execute these script execute step-by-step:
Run the script:
   
  > chmod +x save_to_hdfs.sh
  
  
  >./save_to_hdfs.sh
   
   <img width="960" alt="HDFS-HIVE" src="https://github.com/user-attachments/assets/52814299-f36e-41e9-8646-a2b062a850a8">


#### This will upload your 'population_data.csv' file to the specified HDFS directory.



<img width="960" alt="HDFS-HIVE-5" src="https://github.com/user-attachments/assets/93e3e5d9-de44-4649-bd6b-eed1516646cf">


### Create Hive Database, Load Data, and Query Results :

To create the Hive database and table, load the data, and query it, execute these script execute step-by-step :

Run the script:

> chmod +x hive_operations.sh


> ./hive_operations.sh

<img width="960" alt="HDFS-HIVE-1" src="https://github.com/user-attachments/assets/78750017-4011-4bd1-b7a1-fc16be35e99d">


This will create :

1) a Hive database named 'population_db'.
2) a Hive table named 'p_data'.
3) Load data from the HDFS file into the Hive table.
4) Query the Hive table to verify the data load.

<img width="960" alt="HDFS-HIVE-6" src="https://github.com/user-attachments/assets/34c77ac5-4a6d-4693-bd72-23c3d48af971">



<img width="960" alt="HDFS-HIVE-7" src="https://github.com/user-attachments/assets/be2e6086-02de-41b1-8354-5798c03039c4">


### Automate the Entire process:
Run the script:

> chmod +x automate.sh


> ./automate.sh


<img width="960" alt="HDFS-HIVE-2" src="https://github.com/user-attachments/assets/9b078957-4e68-42dd-b38e-e0a0aa0712bd">


##### This will automate the entire process from saving the CSV Data file into HDFS to Create a Hive Database , Loading the data into it and Query results.

### Explanation of Commands

#### Hadoop Commands
1) hadoop fs -mkdir -p $HDFS_DIR: Creates a directory in HDFS. The -p flag ensures that the directory is created along with any necessary parent directories.
2) hadoop fs -put $LOCAL_FILE $HDFS_DIR: Uploads the local CSV file to the specified HDFS directory.

#### Hive Commands
1) hive -e "CREATE DATABASE IF NOT EXISTS $HIVE_DB;": Creates a Hive database if it doesn’t already exist.
2) hive -e "CREATE TABLE IF NOT EXISTS $HIVE_TABLE (...)": Creates a Hive table with the columns specified. Replace column1, column2, ... columnN with the actual column names from your CSV.

3) hive -e "LOAD DATA INPATH '$HDFS_FILE_PATH' INTO TABLE $HIVE_TABLE;": Loads the CSV data from HDFS into the Hive table.
4) hive -e "SELECT * FROM $HIVE_TABLE LIMIT 10;": Queries the Hive table to retrieve the first 10 rows to verify the data load.

   





