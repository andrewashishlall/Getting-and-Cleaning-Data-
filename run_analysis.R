
library(dplyr)

##  Req 1 - Merges the training and test sets to create one data set

# get the test and training data
train_data <- read.table('./UCI HAR Dataset/train/X_train.txt')
test_data <- read.table('./UCI HAR Dataset/test/X_test.txt')

# get the labels
train_labels <- read.table('./UCI HAR Dataset/train/y_train.txt')
test_labels <- read.table('./UCI HAR Dataset/test/y_test.txt')

# get the subjects
train_subjects <- read.table('./UCI HAR Dataset/train/subject_train.txt')
test_subjects <- read.table('./UCI HAR Dataset/test/subject_test.txt')

# merge them together
total_data <- rbind(train_data,test_data)
total_labels <- rbind(train_labels,test_labels)
total_subjects <- rbind(train_subjects,test_subjects)
full_data <- cbind(total_labels, total_subjects, total_data)

##  Req 4 - Appropriately labels the data set with descriptive
##          variable names

feature_names <- read.table('./UCI HAR Dataset/features.txt')
names(full_data) <- c('activity','subject',feature_names$V2)

##  Req 2 - Extracts only the measurements on the mean and standard
##          deviation for each measurement

data_subset <- full_data[,grepl('activity|subject|-mean()|-std()', names(full_data))]

##  Req 3 - Uses descriptive activity names to name the activities
##          in the data set

activity_names <- read.table('./UCI HAR Dataset/activity_labels.txt')
data_subset$activity <-as.factor(data_subset$activity)
levels(data_subset$activity) <- activity_names$V2

##  Req 5 - From the data set in step 4, creates a second, independent 
#           tidy data set with the average of each variable for each 
#           activity and each subject.

tidy_dataset <- data_subset %>%
  group_by(activity, subject) %>%
  summarize(across(everything(), mean))

write.table(tidy_dataset, 'tidy_dataset.txt', row.names=FALSE)