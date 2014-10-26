Getting clean data set from Human Activity Recognition database Using Smartphones Data Set 
========================================================

Abstract: Get and clean the Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors to extract a tidy data set with subject, activity, variable and measures. 


### Original data
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity were captured at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

For each record in the dataset it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope.
- A 561-feature vector with time and frequency domain variables.
- Its activity label.
- An identifier of the subject who carried out the experiment.

All data files: 
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
- 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

* mean(): Mean value
* std(): Standard deviation
* mad(): Median absolute deviation 
* max(): Largest value in array
* min(): Smallest value in array
* sma(): Signal magnitude area
* energy(): Energy measure. Sum of the squares divided by the number of values. 
* iqr(): Interquartile range 
* entropy(): Signal entropy
* arCoeff(): Autorregresion coefficients with Burg order equal to 4
* correlation(): correlation coefficient between two signals
* maxInds(): index of the frequency component with largest magnitude
* meanFreq(): Weighted average of the frequency components to obtain a mean frequency
* skewness(): skewness of the frequency domain signal 
* kurtosis(): kurtosis of the frequency domain signal 
* bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
* angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

* gravityMean
* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean

### Tidy data variables and data
This file contains the following variables and the data:
* subject - An identifier of the subject who carried out the experiment. Its range is from 1 to 30
* Activity - Identify one of the five activity subject performed. Values include WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING. 
* feature - The name of measurement on the mean and standard deviation for each measurement.
* mean - Average of the measurement by subject, activity and feature. 

### Transformation steps to get the tidy data
Here are the transformation steps to get the tidy data from original data:
* Processing test set to get ready for merging
  * Read file subject_test.txt to data frame test_subject
  * Add id column to the test_subject data frame
  * Read file Y_test.txt to data frame test_activity
  * Add id column to the test_activity data frame
  * Read features.txt to data frame features 
  * Read file X_test.txt to data frame testData and use the features data frame as the col names
  * Add row order column id to the data frame testData
  * Merge testData and test_subject by id
  * Merge testData and test_activity by id
  * Add hardcoded set name "test"

* Processing train set to get ready for merging
  * Read file subject_train.txt to data frame train_subject
  * Add id column to the train_subject data frame
  * Read file Y_train.txt to data frame train_activity
  * Add id column to the train_activity data frame
  * Read file X_train.txt to data frame trainData and use the features data frame as the col names
  * Add row order column id to the data frame trainData
  * Merge trainData and train_subject by id
  * Merge trainData and train_activity by id
  * Add hardcoded set name "train"

* Combine the two data sets and extract the tidy set
  * Merge test and train datasets
  * Use gather to turn feature columns into key and value pair
  * Extracts only the measurements on the mean and standard deviation for each measurement
  * Read file activity_labesls.txt to data frame activities
  * Uses descriptive activity names to name the activities in the data set
  * select only needed columns 
  * Group by subject, activity and feature to calculate average
  * Write out the new tidy dataset




