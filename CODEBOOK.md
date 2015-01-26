---
title: "CODEBOOK for run_analysis.R"
author: "Coach Riley"
date: "Sunday, January 18, 2015"
output: html_document
---

This is a codebook for the run_analysis.R script.  The script generates a tidy data set with variables as follows:

Column 1: Label (a coded variable which describes the activity being performed)
Values 1-6.
1: WALKING
2: WALKING_UPSTAIRS
3: WALKING_DOWNSTAIRS
4: SITTING
5: STANDING
6: LAYING

Column 2: Subject (a coded variable which describes the test subject performing the activity)
Values 1-30
No interpretation is given for the values beyond differentiating between subjects.

Columns 3-68: Averages of Scaled Data
These numeric variables are the averages of the original UCI dataset variables, averaged for each activity & subject combination.  The column names correspond to the value averaged from the original dataset, with the following transformations applied: (format = "original_text_in_UCI_HAR_Dataset","final_text_in_run_analysis.R_output")

        "mean()","average "
        "std()","standard deviation "
        "-X","in the X direction"
        "-Y","in the Y direction"
        "-Z","in the Z direction"
        "tBody","Time Domain, Body "
        "tGravity","Time Domain, Gravity "
        "fBody","Freq Domain, Body "
        "Body Body","Body "
        "AccMag-","Acceleration Magnitude "
        "GyroMag-","Angular Velocity Magnitude "
        "AccJerkMag-","Acceleration Magnitude, Jerk Function "
        "GyroJerkMag-","Angular Velocity Magnitude, Jerk Function "
        "AccJerk-","Acceleration, Jerk Function "
        "GyroJerk-","Angular Velocity, Jerk Function "
        "Acc-","Acceleration "
        "Gyro-","Angular Velocity "

Column 69: Dataset (coded variable representing whether the data came from the 'train' or 'test' dataset)
Values: 1, 2
1: Train
2: Test

Column 70: Activity (Descriptive variable which states the activity being performed)
Values: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LYING

```{r}
summary(cars)
```

You can also embed plots, for example:

```{r, echo=FALSE}
plot(cars)
```

Note that the `echo = FALSE` parameter was added to the code chunk to prevent printing of the R code that generated the plot.


# this script "run_analysis.R" presumes that you have unzipped the UCI HAR Dataset to your
# working directory and that the file "run_analysis.R" has been placed in the working directory