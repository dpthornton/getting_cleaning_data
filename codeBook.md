# Getting and Cleaning Data: Course Project"


## Human Activity Recognition Using Smartphones Data Set 

This document describes the variables in the dataset together with the steps used to transform the original data set.

## Data Summary

The data was taken from:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Briefly, a database was built from the recordings of 30 subjects (aged 18-48) performing activities of daily living (ADL) such as walking, sitting, walking upstairs and downstairs, standing and lying down, all whilst carrying a waist-mounted smartphone with embedded inertial sensors.

Data from the built-in gyroscope and accelerometer was recorded and then partitioned into a test and training dataset, split 70% - %30, respectively.

## Variables

The training and test datasets comprised the same variables, however note this derived data set has been edited to leave only the standard deviation and the mean for each original variable.

The variables in the dataset are described below, which include firstly the subject id for the subject taking the experiment, there are 30 possible subjects (id 1-30). Then also the activity name is provided, one of:

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


| Variable         | Description
|------------------|---------------------------------------------------------------
| subject_id       | id of the subject taking part
| activity         | activity name, there are 6 possibilities
| tBodyAcc-X       | time domain signal from accelerometer X-axial (body)
| tBodyAcc-Y       | time domain signal from accelerometer Y-axial (body)
| tBodyAcc-Z       | time domain signal from accelerometer Z-axial (body)
| tGravityAcc-X    | time domain signal from accelerometer X-axial (gravity)
| tGravityAcc-Y    | time domain signal from accelerometer Y-axial (gravity)
| tGravityAcc-Z    | time domain signal from accelerometer Z-axial (gravity)
| tBodyAccJerk-X   | time domain signal from accelerometer X-axial (body)
| tBodyAccJerk-Y   | time domain signal from accelerometer Y-axial (body)
| tBodyAccJerk-Z   | time domain signal from accelerometer Z-axial (body)
| tBodyGyro-X      | time domain signal from gyroscope X-axial (body)
| tBodyGyro-Y      | time domain signal from gyroscope Y-axial (body)
| tBodyGyro-Z      | time domain signal from gyroscope Z-axial (body)
| tBodyGyroJerk-X  | time domain signal from gyroscope X-axial (body)
| tBodyGyroJerk-Y  | time domain signal from gyroscope Y-axial (body)
| tBodyGyroJerk-Z  | time domain signal from gyroscope Z-axial (body)
| tBodyAccMag      | time domain signal from accelerometer (body) magnitude
| tGravityAccMag   | time domain signal from accelerometer (gravity) magnitude
| tBodyAccJerkMag  | time domain signal from accelerometer (body) jerk magnitude
| tBodyGyroMag     | time domain signal from gyroscope (body) magnitude
| tBodyGyroJerkMag | time domain signal from gyroscope (body) jerk Magnitude
| fBodyAcc-X       | fourier transform of accelerometer X-axial (body) 
| fBodyAcc-Y       | fourier transform of accelerometer Y-axial (body) 
| fBodyAcc-Z       | fourier transform of accelerometer Z-axial (body) 
| fBodyAccJerk-X   | fourier transform of accelerometer X-axial (body) jerk
| fBodyAccJerk-Y   | fourier transform of accelerometer Y-axial (body) jerk
| fBodyAccJerk-Z   | fourier transform of accelerometer Z-axial (body) jerk
| fBodyGyro-X      | fourier transform of gyroscope X-axial (body) 
| fBodyGyro-Y      | fourier transform of gyroscope Y-axial (body)
| fBodyGyro-Z      | fourier transform of gyroscope Z-axial (body)
| fBodyAccMag      | fourier transform of accelerometer (body) magnitude
| fBodyAccJerkMag  | fourier transform of accelerometer (body) jerk magnitude
| fBodyGyroMag     | fourier transform of gyroscope (body) magnitude
| fBodyGyroJerkMag | fourier transform of gyroscope (body) jerk magnitude

For each of the above variables, the mean and standard deviations were further calculated ('-mean()' and '-std()'), to give a total 68 variables in the data set.

As described further below, the dataset has been grouped by subject and activity name
to produce the means for each variable.