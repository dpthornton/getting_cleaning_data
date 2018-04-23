# Getting and Cleaning Data: Course Project

## Human Activity Recognition Using Smartphones Data Set 

This document describes the variables in the dervied data set produced from running run_analysis.R

See the originating project for further details:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Variables

The training and test data sets from the project comprise the same variables, however note the derived data set has been edited to leave only the standard deviation and the mean for each original variable.

The variables in the data set are described below, which include firstly the subject id for the subject taking the experiment, there are 30 possible subjects (id 1-30). Then also the activity name is provided, one of:

WALKING
WALKING_UPSTAIRS
WALKING_DOWNSTAIRS
SITTING
STANDING
LAYING

In addition, the data set includes a number of variables taken from signals obtained from the gyroscope and accelerometer in the device attached to the subject, an understanding of these variables can be derived from the name of the variable. 

The letter 't' or 'f' at the start of the variable describes if the variable is the original time domain signal captured at a constant rate of 50hz, or a fourier transform of the original time domain variable whereby the f denotes frequency domain of the original signal. The 'Acc' and 'Gyro', denote accelerometer and gyroscope derived data, respectively.

The variables are also named based on the type of acceleration signal, the component of the signal due to gravity (e.g. GravityAcc) and that from body movement alone (e.g. BodyAcc), as identified from filtering the signals. For the body signals, linear acceleration and angular velocity were also derived in time to obtain Jerk signals, denoted 'Jerk'.

Finally for some of the variables, the magnitude of these three-dimensional signals were calculated (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag)

The X, Y and Z in each variable denotes the plane of movement that was captured.


For each of the below variables (output from run_analysis.R), the mean and standard deviations were further calculated ('-mean()' and '-std()'), to give a total 68 variables in the data set.

Note also that the final data set produced by the run_analysis.R script has been grouped by subject and activity_name name to produce the means for each variable.


| Variable         | Description
|------------------|---------------------------------------------------------------------
| subject_id       | id of the subject taking part
| activity_name    | activity name, there are 6 possibilities
| tBodyAcc-X       | time domain signal from accelerometer X-axial (body movement)
| tBodyAcc-Y       | time domain signal from accelerometer Y-axial (body movement)
| tBodyAcc-Z       | time domain signal from accelerometer Z-axial (body movement)
| tGravityAcc-X    | time domain signal from accelerometer X-axial (gravity)
| tGravityAcc-Y    | time domain signal from accelerometer Y-axial (gravity)
| tGravityAcc-Z    | time domain signal from accelerometer Z-axial (gravity)
| tBodyAccJerk-X   | time domain signal from accelerometer X-axial (body movement) jerk
| tBodyAccJerk-Y   | time domain signal from accelerometer Y-axial (body movement) jerk
| tBodyAccJerk-Z   | time domain signal from accelerometer Z-axial (body movement) jerk
| tBodyGyro-X      | time domain signal from gyroscope X-axial (body movement)
| tBodyGyro-Y      | time domain signal from gyroscope Y-axial (body movement)
| tBodyGyro-Z      | time domain signal from gyroscope Z-axial (body movement)
| tBodyGyroJerk-X  | time domain signal from gyroscope X-axial (body movement) jerk
| tBodyGyroJerk-Y  | time domain signal from gyroscope Y-axial (body movement) jerk
| tBodyGyroJerk-Z  | time domain signal from gyroscope Z-axial (body movement) jerk
| tBodyAccMag      | time domain signal from accelerometer (body movement) magnitude
| tGravityAccMag   | time domain signal from accelerometer (gravity) magnitude
| tBodyAccJerkMag  | time domain signal from accelerometer (body movement) jerk magnitude
| tBodyGyroMag     | time domain signal from gyroscope (body movement) magnitude
| tBodyGyroJerkMag | time domain signal from gyroscope (body movement) jerk Magnitude
| fBodyAcc-X       | fourier transform of accelerometer X-axial (body movement) 
| fBodyAcc-Y       | fourier transform of accelerometer Y-axial (body movement) 
| fBodyAcc-Z       | fourier transform of accelerometer Z-axial (body movement) 
| fBodyAccJerk-X   | fourier transform of accelerometer X-axial (body movement) jerk
| fBodyAccJerk-Y   | fourier transform of accelerometer Y-axial (body movement) jerk
| fBodyAccJerk-Z   | fourier transform of accelerometer Z-axial (body movement) jerk
| fBodyGyro-X      | fourier transform of gyroscope X-axial (body movement) 
| fBodyGyro-Y      | fourier transform of gyroscope Y-axial (body movement)
| fBodyGyro-Z      | fourier transform of gyroscope Z-axial (body movement)
| fBodyAccMag      | fourier transform of accelerometer (body movement) magnitude
| fBodyAccJerkMag  | fourier transform of accelerometer (body movement) jerk magnitude
| fBodyGyroMag     | fourier transform of gyroscope (body movement) magnitude
| fBodyGyroJerkMag | fourier transform of gyroscope (body movement) jerk magnitude

