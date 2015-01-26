# this script "run_analysis.R" presumes that you have unzipped the UCI HAR Dataset to your
# working directory and that the file "run_analysis.R" has been placed in the working directory

#it also presumes you have loaded the package "plyr" using the function library(plyr) prior to running this code.

run_analysis <- function() {
        
        #read in the train and the test data        
        train <- read.table("UCI HAR Dataset/train/X_train.txt")
        test <- read.table("UCI HAR Dataset/test/X_test.txt")

        #read in additional data to name the dataset and to create the activities columns.
        features <- read.table("UCI HAR Dataset/features.txt", stringsAsFactors=FALSE)
        extraName <- c(562, "Label")
        activities <- read.table("UCI HAR Dataset/activity_labels.txt")
        
        features <- rbind(features,extraName,c("dataset"),c("subject"))
        
        #read in the coded activity labels and subjects
        trainLabel <- read.table("UCI HAR Dataset/train/Y_train.txt")
        testLabel <- read.table("UCI HAR Dataset/test/Y_test.txt")
        trainSubject <- read.table("UCI HAR Dataset/train/subject_train.txt")
        testSubject <- read.table("UCI HAR Dataset/test/subject_test.txt")
        
        # combines the dataset with the activity labels, dataset code (1 for 'train' or 2 for 'test'), and the subject
        train <- cbind(train,trainLabel,c(1),trainSubject)
        test <- cbind(test,testLabel,c(2),testSubject)
        
        # assigns new column names to the train and test datasets, as well as the coded activity data frame
        colnames(train) <- features[[2]]
        colnames(test) <- features[[2]]
        colnames(activities) <- c("V1","Activity")
        
        #Merges the training and the test sets to create one data set.
        allData <- rbind(train,test)
        
        #Extract Mean and SD Columns
        #From the features_info.txt file, the programmer has chosen to ignore the columns of meanFreq() and 
        #the 5 columns used on the angle() variable, based on my interpretation of the assignment's request.  
        allData2 <- cbind(allData[,c(grepl("mean()",names(allData),fixed=TRUE))],allData[,c(grepl("std()",names(allData),fixed=TRUE))],Label=allData$Label, Dataset=allData$dataset,Subject=allData$subject)
        
        #Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
        finalData <- aggregate(allData2,by=list(Label=allData2$Label,Subject=allData2$Subject),mean)
        
        # removes duplicate columns for Label and Subject
        finalData <- finalData[,c(1:68,70)]
        
        #Uses descriptive activity names to name the activities in the data set by merging the activity labels
        #with the final dataset on the 'labels' column.
        finalData <- merge(finalData,activities,by.x="Label",by.y="V1",all=TRUE)
        
        #Appropriately labels the data set with descriptive variable names. 
        #reuses the 'features' variable to keep from creating another variable.  Read in current names from finalData
        features <- colnames(finalData)
        
        #make appropriate substitutions based on information in features_info.txt
        features <- sub("mean()","average ",features)
        features <- sub("std()","standard deviation ",features)
        features <- sub("-X","in the X direction",features)
        features <- sub("-Y","in the Y direction",features)
        features <- sub("-Z","in the Z direction",features)
        features <- sub("tBody","Time Domain, Body ",features)
        features <- sub("tGravity","Time Domain, Gravity ",features)
        features <- sub("fBody","Freq Domain, Body ",features)
        features <- sub("Body Body","Body ",features)
        features <- sub("AccMag-","Acceleration Magnitude ",features)
        features <- sub("GyroMag-","Angular Velocity Magnitude ",features)
        features <- sub("AccJerkMag-","Acceleration Magnitude, Jerk Function ",features)
        features <- sub("GyroJerkMag-","Angular Velocity Magnitude, Jerk Function ",features)
        features <- sub("AccJerk-","Acceleration, Jerk Function ",features)
        features <- sub("GyroJerk-","Angular Velocity, Jerk Function ",features)
        features <- sub("Acc-","Acceleration ",features)
        features <- sub("Gyro-","Angular Velocity ",features)
        
        #rename columns in the final dataset
        colnames(finalData) <- features
        
        # returns the final tidy dataset
        finalData
        
}