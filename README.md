run_analysis.R
========================================================


```{r}
This script will read in test and train data sets to create one data set. it will only extracts the measurements with mean or std on their names and have descriptive activity names for the activities  in the data set. It will also label the columns with descrptive names. at the end, the script will create a tidy data set with the average of each variable for each activity and each subject. 
```

### Prerequisites
* Required data sets
 1. All the data will be saved in the folder named UCI HAR Dataset in the workspace.
 2. There will be two folders in UCI HAR Dataset: test and train.
 3. Under test folder, there are three files: X_test.txt, y_test.txt and subject_test.txt. 
 4. Under train folder, there are three files: X_train.txt, y_train.txt and subject_train.txt. 
 5. The features.txt and activity_labels.txt are stored in the folder UCI HAR Dataset. 
* Script
 1. run_analysis.R script is stored in the workspace. 

### Steps to run the script
1. Set the workspace to desired folder in R.
2. Create a folder named UCI HAR Dataset in the workspace. 
3. Copy features.txt and activity_labels.txt to the folder UCI HAR Dataset.
4. Copy test and train folder to folder UCI HAR Dataset. Make sure that all data files are stored in both folders. 
5. Copy the run_analysis.R to the workspace.
6. Run Source("run_analysis.R") to read the script into R. 
7. A file named "tidy_data.txt" should be created in the folder that was set as workspace.
8. To verify the data, run mydata <- read.table("tidy_data.txt", header=TRUE)
9. Run head(mydata) to view the data. 
 