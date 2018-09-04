CodeBook
This is a code book for the Week4 project of Getting & Cleaning Data - The Activity Tracker Project for wearable tech on Samsung Galaxy phones.

The Original Data Source URL
•Data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
•Description of the dataset: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Data Set Information
This project comes from data collected through wearable tech that captures relevant data for six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S) on the waist. 
A group of 30 volunteers within an age bracket of 19-48 years participated in the experiment for data collection. The data was captured using the embedded accelerometer and gyroscope on the smartphone. We captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The Data

The dataset that was downloaded included the following files:

•'README.txt'

•'train/X_train.txt': Training set under the train folder

•'train/y_train.txt': Training labels under the train folder

•'test/X_test.txt': Test set under the Test folder


•'test/y_test.txt': Test labels under the Test folder


•'features_info.txt': Shows information about the variables used on the feature vector in the root folder of the data


•'features.txt': List of all features in the root folder of the data

•'activity_labels.txt': Links the class labels with their activity name in the root folder of the data


The following files are available for the train and test data. Their descriptions are equivalent.

•'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample ranging from 1 to 30.

•'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis.

•'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration.


•'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.


Transitional Steps

1. Read the individual files into tables 
2. Assigns column names to the training and the test sets
3. Merge the data sets into one
2.Create an subset of only the measurements on the mean and standard deviation for each measurement
3.Uses descriptive activity names to name the activities in the data set
4.Label the data set with descriptive and relevant activity names
5.Create the final, required tidy data set with the average of each variable for each activity and each subject

How run_analysis.R contains step by step implementation
a.Install, load necessary libraries
b.Read both test and train data into respective tables
c.Read and load the features and activity labels
d.Merge the data sets on the common column names using rbind & cbind where needed
e.Compute the mean and standard deviation column names and data
f.Merge the computed Mean & Standard Deviation values into the total data set
g.Create a new tidy data set with only extracted values of averages & SD for the activities recorded in the experiment
