# README

This project includes code to download and transform data from the following project:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Briefly the project involved a database built from the recordings of 30 subjects (aged 18-48) performing activities of daily living (ADL) such as walking, sitting, walking upstairs and downstairs, standing and lying down, all whilst carrying a waist-mounted smartphone with embedded inertial sensors.

Data from the built-in gyroscope and accelerometer was recorded and then partitioned into a test and training dataset, split 70% - %30, respectively.

The code to download and transform the dataset from the above project can be done using run_analysis.R, which contains a series of steps that have been commented.

## codeBook.md

Contains primarily a description of the variables in the final data set produced by run_analysis.R

## run_analysis.R 

The signal data was loaded into R, as taken from the files train/X_train.txt and test/X_test.txt

In order to provide more descriptive columns names, the columns were matched using the file: features.txt

Only the variables for the mean and standard deviation are taken from the original variables in the test and train datasets. The test and train data sets are then merged by row using the 'rbind' function to produce a longer dataset containing all subject ids. Note the subjects ids in the test and train dataset are independent, therefore no duplicate rows were created.

A new column was added to both the test and train datasets using the files train/subject_train.txt and test/subject_test.txt, respectively, in order to also make available the subject id for each variable.

Furthermore the activity name associated with each variable was derived from the files train/y_train.txt and test/y_test.txt, for train and test, respectively. In addition, rather than display the activity id, a look-up file to the activity name, 'activity_labels.txt' was loaded and merged with the activity id data, so that the test and train data sets would contain the more descriptive activity name.

Therefore for each variable, we have the associated activity and subject id, associated with both the test and train data sets.

Finally the means of all variables in the merged dataset were calculated, grouped by subject id and activity, and stored in a variable called all_data_means_df, which is also written to file.