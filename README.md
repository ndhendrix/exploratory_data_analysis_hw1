##Exploratory Data Analysis, Course Project 1
-------------------------------------------
Using the electric power consumption dataset from the UC Irvine Machine Learning Repository.
Its goal is to read the data and create four charts as described on [Roger Peng's page](https://github.com/rdpeng/ExData_Plotting1).

The general strategy for all four scripts is as follows:
<ol>
<li>Read the dataset into memory
<li>Select only a subset of the data to be stored into a new dataframe
<li>Delete the large dataset from memory
<li>Cast the variables to be charted into useable formats using <a href="http://cran.r-project.org/web/packages/lubridate/index.html">lubridate</a> for the dates
<li>Chart using R's base plotting system
</ol>