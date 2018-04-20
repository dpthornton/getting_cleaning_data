############################################################################
# Author: Daniel Thornton                                                  #
# Date: 17 April 2018                                                      #
# Summary: data set transformation of accelerometer and gyroscopic data    #
############################################################################

# STEP 1
# Download and set working directory
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip","samsung_data.zip")
unzip("samsung_data.zip")
setwd("UCI HAR Dataset")

# STEP 2
# Read in the training and test set
train_data <- read.table("train/X_train.txt")
test_data <- read.table("test/X_test.txt")

# STEP 3
# Apply more descriptive column names, based on those provided in features.txt
features <- read.table("features.txt")
colnames(train_data) <- features$V2
colnames(test_data) <- features$V2

# STEP 4
# Obtain subject ids associated with each variable in the data sets
subject_train <- read.table("train/subject_train.txt")
subject_test <- read.table("test/subject_test.txt")
colnames(subject_train) <- "subject_id"
colnames(subject_test) <- "subject_id"

# STEP 5
# Obtain activity names for all variables, derived from the activity id
activity_train <- read.table("train/y_train.txt")
activity_test <- read.table("test/y_test.txt")
activity_labels <- read.table("activity_labels.txt")
activity_train <- merge(activity_train, activity_labels, by.x="V1",b.y="V1",all=TRUE)
activity_test <- merge(activity_test, activity_labels, by.x="V1",b.y="V1",all=TRUE)
colnames(activity_train) <- c("activity_id","activity_name")
colnames(activity_test) <- c("activity_id","activity_name")

# STEP 6
# Merge the dataframes containing subject and activity information
train_data_with_subject_and_activity <- cbind(subject_train, activity=activity_train[,"activity_name"], train_data)
test_data_with_subject_and_activity <- cbind(subject_test, activity=activity_test[,"activity_name"], test_data)

# STEP 7
# Filter data to take only the standard deviation and mean columns
filtered_test_data <- test_data_with_subject_and_activity[, grep(c("mean\\(|std\\(|subject_id|activity"), names(test_data_with_subject_and_activity))]
filtered_train_data <- train_data_with_subject_and_activity[, grep(c("mean\\(|std\\(|subject_id|activity"), names(train_data_with_subject_and_activity))]

# STEP 8
# Merge test and training datasets
test_and_train_rows <- rbind(filtered_test_data, filtered_train_data)

# STEP 9
# Obtain a summary dataframe comprising the means of all variables in STEP 7 
# grouped by subject and activity
test_and_train_row_mean <- test_and_train_rows %>% group_by(subject_id, activity) %>%summarise_all(funs(mean))
test_and_train_row_mean <- as.data.frame(test_and_train_row_mean)
write.table(test_and_train_row_mean, file="tidy_dataset.txt", row.name=FALSE)
