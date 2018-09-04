Getting and Cleaning Data

Week 4 -  Creating a Tidy Data Set - Course Project

Requirements given in the course project

Create one R script called run_analysis.R that does the following.
1.Merges the training and the test sets to create one data set.
2.Extracts only the measurements on the mean and standard deviation for each measurement.
3.Uses descriptive activity names to name the activities in the data set
4.Appropriately labels the data set with descriptive activity names.
5.Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Steps to execute this course project
1.Set the working directory similar to the one given in the Run Analysis.R
2.Install necessary libraries
3.Download the data source and to your local drive. I have it in the 'UCI HAR Dataset' folder.
4.Create/Save run_analysis.R in the parent folder of UCI HAR Dataset, which will be your working directory in RStudio.
5. There will be two folders called 'Test' & 'train' under the root folder 'UCI HAR Dataset' and files named - activity_labels.txt, features.txt 
6.Run source("run_analysis.R"), then it will generate a new file TidyDataSet.txt in your working directory which is the 'UCI HAR Dataset' folder.

Dependencies
The "run_analysis.R" file is structured in such a way that necessary libraries, paths are all set to help create the new tidy data set.
