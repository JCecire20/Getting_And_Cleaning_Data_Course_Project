### Peer-graded Assignment: Getting and Cleaning Data Course Project

##Preloading packages
library(dplyr)
library(data.table)

##Getting the data
#Checking for directory and downloading file into folder
if(!file.exists("./Getting_And_Cleaning_Data_Course_Project")){
    dir.create("./Getting_And_Cleaning_Data_Course_Project")}
fileUrl = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./Getting_And_Cleaning_Data_Course_Project/rawDataset.zip", method = "curl")

#Unzipping the file
unzip(zipfile = "./Getting_And_Cleaning_Data_Course_Project/rawDataset.zip", exdir = "./Getting_And_Cleaning_Data_Course_Project")

path_rf <- file.path("./Getting_And_Cleaning_Data_Course_Project" , "UCI HAR Dataset")
files<-list.files(path_rf, recursive=TRUE)
files


##Merging the training and the test sets to create one data set
# Refer: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
# Activity Labels and Features
activityLabels <- read.table(file.path(path_rf, "activity_labels.txt"), col.names = c("activityCode", "activity"))
featuresNames <- read.table(file.path(path_rf, "features.txt"), col.names = c("n", "functions"))

# Test Data
s_test <- read.table(file.path(path_rf, "test" , "subject_test.txt"), col.names = c("subject"))
X_test <- read.table(file.path(path_rf, "test" , "X_test.txt"), col.names = featuresNames$functions) #Must read in the features.txt first
y_test <- read.table(file.path(path_rf, "test" , "y_test.txt"), col.names = c("activityCode"))

# Train Data
s_train <- read.table(file.path(path_rf, "train", "subject_train.txt"), col.names = c("subject"))
X_train <- read.table(file.path(path_rf, "train", "X_train.txt"), col.names = featuresNames$functions) #Must read in the features.txt first
y_train <- read.table(file.path(path_rf, "train", "y_train.txt"), col.names = c("activityCode"))



# Investigating the properties of the Activity Lables, Features, Test Data and Train Data Variables
str(activities)
str(features)
str(s_test)
str(X_test)
str(y_test)
str(s_train)
str(X_train)
str(y_train)


#Bind 
featuresData <- rbind(X_train, X_test)   # X_train and X_test are now labeled as features because those two variables 
                                         # contain the recorded features data 
activity <- rbind(y_train, y_test)       # y_train and y_test are now labeled as activity because the numbers
                                         # in the file represent which activity is occuring. 
subjectData <- rbind(s_train, s_test)    # s_train and s_test are now labeled as subject because the s stood for subject data.

mainData <- cbind(subjectData, activity, featuresData)  #this makes it so that we have one main data set

## Extracting only the measurments on the mean and standard deviation for each measurment 
mergedData <- mainData %>% select(subject, activityCode, contains("mean"), contains("std"))

##Using descriptive activity names to name the activities in the data set
mergedData$activityCode <- activityLabels[mergedData$activityCode, 2]

## Appropriately labeling the data set with descriptive variable names
names(mergedData)[2] = "activity"
names(mergedData)<-gsub("Acc", "Accelerometer", names(mergedData))
names(mergedData)<-gsub("Gyro", "Gyroscope", names(mergedData))
names(mergedData)<-gsub("BodyBody", "Body", names(mergedData))
names(mergedData)<-gsub("Mag", "Magnitude", names(mergedData))
names(mergedData)<-gsub("^t", "Time", names(mergedData))
names(mergedData)<-gsub("^f", "Frequency", names(mergedData))
names(mergedData)<-gsub("tBody", "TimeBody", names(mergedData))

#Check names
names(mergedData)

## From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidyData <- mergedData %>%
    group_by(subject, activity) %>%
    summarise_all(funs(mean))
write.table(tidyData, "tidyData.txt", row.name=FALSE)

## Final Check
#Checking variable names
str(tidyData)

# Look over tidy data
tidyData




