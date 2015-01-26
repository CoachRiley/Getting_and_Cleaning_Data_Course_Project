---
title: "README for run_analysis.R"
output: html_document
---

run_analysis.R is an R script which reads in data from the UCI HAR Dataset, selects the mean and standard deviation columns, and returns the average of these columns by test subject and activity.  The output of run_analysis.R is a tidy dataset (data frame).

The original dataset can be found here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

run_analysis.R presumes that you have unzipped the UCI HAR Dataset in a folder called "UCI HAR Dataset".  The script itself (run_analysis.R) is contained in the same folder that contains the folder UCI HAR Dataset.

The script presumes that you have set your working directory to be the folder which contains the script and the UCI HAR Dataset folder.  It also presumes that you have loaded the "plyr" package in R.

To initiate the script, type the following code in the console window at the '>' prompt:
```
run_analysis()
```

or, if you wish to have the tidy data set returned to a variable in the global environment, you may try

```
var1 <- run_analysis()
```

This dataset includes a Codebook (codebook.md) which explains the contents of the tidy data set.  The entire set of documents (run_analysis.R, Readme.md, and codebook.md) can be found at http
