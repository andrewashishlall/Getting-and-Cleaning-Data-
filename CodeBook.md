run_analysis.R does the following:

##  Req 1 - Merges the training and test sets to create one data set

The training and test data for each are merged together using rbind().  

Variable Data:  
./UCI HAR Dataset/train/X_train.txt  
./UCI HAR Dataset/test/X_test.txt  

There are also data on the subject and the activity being performed.
These are also bound together in pairs:

Activity Data:  
./UCI HAR Dataset/train/y_train.txt  
./UCI HAR Dataset/test/y_test.txt  

Subject Data:  
./UCI HAR Dataset/train/subject_train.txt  
./UCI HAR Dataset/test/subject_test.txt  

The activity label and subject become additional columns next to the recorded 
data using cbind().

##  Req 4 - Appropriately labels the data set with descriptive variable names

The descriptive variable names are retrieved from the file and added
as the column headers, in addition to column headers for 
activity label and subject

Descriptive Variable Names:  
./UCI HAR Dataset/features.txt  

##  Req 2 - Extracts only the measurements on the mean and standard deviation for each measurement

The label names are used to keep only the mean and standard deviation
for each measurement.  These are all the variables ending in -std()
or -mean().  See below for more details.

##  Req 3 - Uses descriptive activity names to name the activities in the data set

Replaces the activity numbers with their descritive names.

Activity Labels:  
./UCI HAR Dataset/activity_labels.txt  

##  Req 5 - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Data is grouped by subject and activity label, then each group
is summarized by taking the mean.  The form is maintained in
order to more carefully show the links between variables, since
they are not truely independent and instead part of the same measurement.

This gives 180 observations of 81 variables.  

__________________________________________________________________________________

Results are written out to tidy_dataset.txt in the working directory.


Variables are as follows:

activity:  
1 WALKING  
2 WALKING_UPSTAIRS  
3 WALKING_DOWNSTAIRS  
4 SITTING  
5 STANDING  
6 LAYING  

subject:
test subject id number, 1-30

measurement variables: 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ  
tGravityAcc-XYZ  
tBodyAccJerk-XYZ  
tBodyGyro-XYZ  
tBodyGyroJerk-XYZ  
tBodyAccMag  
tGravityAccMag  
tBodyAccJerkMag  
tBodyGyroMag  
tBodyGyroJerkMag  
fBodyAcc-XYZ  
fBodyAccJerk-XYZ  
fBodyGyro-XYZ  
fBodyAccMag  
fBodyAccJerkMag  
fBodyGyroMag  
fBodyGyroJerkMag  

The set of variables that were estimated from these signals are: 

mean(): Mean value  
std(): Standard deviation  

The acceleration signal from the smartphone accelerometer X axis in standard gravity
units 'g'. Every row shows a 128 element vector. The same description applies for the
'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis.

Features are normalized and bounded within [-1,1].

The complete list of variables of each feature vector is available in 'features.txt'
and 'features_info.txt'

