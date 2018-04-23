############################################################################
# Author: Daniel Thornton                                                  #
# Date: 17 April 2018                                                      #
# Summary: data set transformation of accelerometer and gyroscopic data    #
# Version: R version 3.3.1                                                 #
############################################################################

library(data.table)
install.packages("dplyr")
library(dplyr)

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
# Filter data to take only the standard deviation and mean columns
test_data <- test_data[, grep(c("mean\\(|std\\("), names(test_data))]
train_data <- train_data[, grep(c("mean\\(|std\\("), names(train_data))]

# STEP 5
# Obtain subject ids associated with each variable in the data sets
subject_train <- read.table("train/subject_train.txt")
subject_test <- read.table("test/subject_test.txt")
colnames(subject_train) <- "subject_id"
colnames(subject_test) <- "subject_id"

# STEP 6
# Obtain activity ids for all variables, add to the data sets
activity_y_train <- read.table("train/y_train.txt")
activity_y_test <- read.table("test/y_test.txt")
train_data_with_activity <- cbind(subject_train, activity=activity_y_train$V1, train_data)
test_data_with_activity <- cbind(subject_test, activity=activity_y_test$V1, test_data)

## STEP 7
# Create one dataset by merging test and train sets
all_data <- rbind(train_data_with_activity,test_data_with_activity)

## STEP 8
# Label the activities using the activity names instead of the ids
activity_labels <- read.table("activity_labels.txt")
all_data <- merge(all_data, activity_labels, by.x="activity",by.y="V1")
all_data <- subset(all_data, select = -c(activity))
setnames(all_data, "V2", "activity_name")
all_data<-all_data[,c(68, 1:(ncol(all_data)-1))]
str(all_data)

# STEP 9
# Obtain a summary dataframe comprising the means of all variables in STEP 8, 
# grouped by subject and activity
all_data_means <- all_data %>% group_by(subject_id, activity_name) %>%summarise_all(funs(mean))
all_data_means_df <- as.data.frame(all_data_means)
write.table(all_data_means_df, file="tidy_dataset.txt", row.name=FALSE)
