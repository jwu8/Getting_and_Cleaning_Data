## load library 
library(tidyr)
library(dplyr)

## Processing test set to get ready for merging
## Read file subject_test.txt to data frame test_subject
test_subject <- read.table("./UCI HAR Dataset/test/subject_test.txt", col.names = c("subject"))

## Add id column to the test_subject data frame
test_subject <- mutate(test_subject, id = seq_len(nrow(test_subject)))

## Read file Y_test.txt to data frame test_activity
test_activity <- read.table("./UCI HAR Dataset/test/Y_test.txt", col.names = c("activityID"))

## Add id column to the test_activity data frame
test_activity <- mutate(test_activity, id = seq_len(nrow(test_activity)))

## Read features.txt to data frame features 
features <- read.table("./UCI HAR Dataset/features.txt", col.names = c("featureID", "feature"))

## Read file X_test.txt to data frame testData and use the features data frame as the col names
testData <- read.table("./UCI HAR Dataset/test/X_test.txt", col.names = features$feature, row.names = NULL)

## Add row order column id to the data frame testData
testData <- mutate(testData, id = seq_len(nrow(testData)))

## Merge testData and test_subject by id
testData <- merge(testData, test_subject, by="id")

## Merge testData and test_activity by id
testData <- merge(testData, test_activity, by="id")

## Add hardcoded set name "test"
testData <- mutate(testData, setName = "test")

## End of initial processing of test set

## Processing train set to get ready for merging
## Read file subject_train.txt to data frame train_subject
train_subject <- read.table("./UCI HAR Dataset/train/subject_train.txt", col.names = c("subject"))

## Add id column to the train_subject data frame
train_subject <- mutate(train_subject, id = seq_len(nrow(train_subject)))

## Read file Y_train.txt to data frame train_activity
train_activity <- read.table("./UCI HAR Dataset/train/Y_train.txt", col.names = c("activityID"))

## Add id column to the train_activity data frame
train_activity <- mutate(train_activity, id = seq_len(nrow(train_activity)))

## Read file X_train.txt to data frame trainData and use the features data frame as the col names
trainData <- read.table("./UCI HAR Dataset/train/X_train.txt", col.names = features$feature, row.names = NULL)

## Add row order column id to the data frame trainData
trainData <- mutate(trainData, id = seq_len(nrow(trainData)))

## Merge trainData and train_subject by id
trainData <- merge(trainData, train_subject, by="id")

## Merge trainData and train_activity by id
trainData <- merge(trainData, train_activity, by="id")

## Add hardcoded set name "train"
trainData <- mutate(trainData, setName = "train")

## End of initial processing of train set 

## Assignment step 1, merge test and train datasets
myData <- rbind(testData, trainData)

## Use gather to turn feature columns into key and value pair
myData_1 <- gather(myData, feature, value, -id, -activityID, -subject, -setName)

## Assignment step 2 - Extracts only the measurements on the mean 
## and standard deviation for each measurement
myData_2 <- myData_1[grep('mean()|std()', myData_1$feature),]

## Read file activity_labesls.txt to data frame activities
activities <- read.table("./UCI HAR Dataset/activity_labels.txt", col.names = c("activityID", "activity"))

## Assignment step 3 - Uses descriptive activity names to name the activities in the data set
myData_3 <- merge(myData_2, activities, by="activityID")

##select only needed columns 
##Assignment step 4 has been done through previous steps 
## - Appropriately labels the data set with descriptive variable names
myData_4 <- select(myData_3, subject, activity, setName, feature, value)

## Group by subject, activity and feature to calculate average
## Assignment step 5 - creates a second, independent tidy data set 
## with the average of each variable for each activity and each subject
myData_5 <- group_by(myData_4, subject, activity, feature)
myFinalData <- summarise(myData_5, mean=mean(value))

##Write out the new tidy dataset
write.table(myFinalData, "tidy_data.txt", sep="\t", row.name = FALSE)



