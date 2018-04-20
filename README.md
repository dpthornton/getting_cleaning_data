# README

## Intro

This repository contains code and information taken from the following project:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#

The code to download and transform the dataset from the above project can be done using run_analysis.R, which contains a series of steps that have been commented.

The variables in the derived dataset as output from the run_analysis.R script are described in codeBook.md.


## run_analysis.R 

The signal data was loaded into R, as taken from the files train/X_train.txt and test/X_test.txt

In order to provide more descriptive columns names, the columns were matached using the files features.txt

A new column was then added to both the test and train datasets using the files train/subject_train.txt and test/subject_test.txt, respectively, in order to also make available the subject id for each variable.

Furthermore the activity name associated with each variable was derived from the files train/y_train.txt and test/y_test.txt, respectively. In addition, rather than present the activity id, a look-up file to the activity name, 'activity_labels.txt' was loaded and merged with the activity id data, so that the test and train data sets would contain the more descriptive activity name.

Therefore for each variable, we now have the associated activity and subject id, associated with both the test and train data sets.

Finally only the variables for the mean and standard deviation are taken from the original variables in the test and train datasets. These datasets for test and train are then merged by row using the rbind function. Note the subjects ids in the test and train dataset are independent, therefore no duplicate rows were created.

Finally the mean and std of the merged dataset were calculated, grouped by subject id and activity, and stored in a variable called test_and_train_row_mean.