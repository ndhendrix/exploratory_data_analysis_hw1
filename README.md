##Exploratory Data Analysis, Course Project 1
-------------------------------------------
Using the electric power consumption dataset from the UC Irvine Machine Learning Repository.
Its goal is to read the data and create four charts as described on [Roger Peng's page][https://github.com/rdpeng/ExData_Plotting1].

The general strategy for all four scripts is as follows:
1. Read the dataset into memory
2. Select only a subset of the data to be stored into a new dataframe
3. Delete the large dataset from memory
4. Cast the variables to be charted into useable formats using [lubridate][http://cran.r-project.org/web/packages/lubridate/index.html] for the dates
5. Chart using R's base plotting system