**Unlocking Olympic Data Analysis: SQL Insights into Decades of Games**
------------------------------------------------------------------------------------------
This project focuses on analyzing the 120 years of Olympics history dataset using SQL queries.

The dataset consists of two tables: "dataset_olympics.csv" and "noc_region.csv".

The "dataset_olympics" table contains information about athletes, their teams, the Olympic Games they participated in, and the medals they won.

The "noc_region" table provides the mapping between the National Olympic Committee codes (NOC) and the corresponding regions. By cleaning the dataset using Python and Pandas, the project aims to ensure data quality.

To extract insights based on the questions given, SQL queries will be written in query.sql file
Module 1: Cleaning the dataset
Task 1:

The initial stage of the project involves preprocessing two distinct datasets that will be used('dataset_olympics' and 'noc_region'). The data cleaning process is crucial before we can proceed to upload these datasets into the database. By doing so, we will be able to perform SQL tasks and conduct further analysis as part of the project.

Data Cleaning for dataset_olympics.csv:

The data_cleaning() function reads data from a 'dataset_olympics'.csv file and performs cleaning operations on the dataset. It creates a copy of the data and drops specific columns, such as 'Height' and 'Weight'. Duplicate rows are also removed. Additionally, missing values in the 'Medal' column are replaced with 'Medal-less', and missing values in the 'Age' column are filled with the median age('24') from the dataset. Finally, the cleaned dataset is saved to a new CSV file named 'olympics_history_cleaned.csv'.

Task 2:

Data Cleaning for noc_region.csv:

The data_cleaning() function reads data from a noc_region.csv file and performs cleaning operations on the dataset. It creates a copy of the data and drops the 'notes' column. The function then renames specific columns, such as 'noc_region' to 'NOC' and 'reg' to 'region'. The cleaned dataset is saved to a new CSV file named 'olympics_history_noc_regions_cleaned.csv'. Finally, the function returns the cleaned dataset for further analysis or processing.

Task 3:

Create following table in Mysql using cleaned datset .csv file

olympics_history olympics_history_noc_regions
**
**Module 2****
Analyzing Data using sql
