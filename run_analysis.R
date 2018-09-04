# Set the working directory
setwd("~/R/Getting & CleaningData/Week4Project/UCI HAR Dataset")

# Add the libraries required to complete the necessary formulae
library("reshape2", lib.loc="~/R/win-library/3.4")
library("dplyr", lib.loc="~/R/win-library/3.4")
library("data.table", lib.loc="~/R/win-library/3.4")

# Download the data files required for the project
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

download.file(fileUrl,destfile="/data/Dataset.zip")

# Load the Training Data tables for all the files
xTrain <- read.table("train/X_train.txt")
yTrain <- read.table("train/y_train.txt")
subTrain <- read.table("train/subject_train.txt")

# Load the Test Data tables for all the files
xTest <- read.table("test/X_test.txt")
yTest <- read.table("test/y_test.txt")
subTest <- read.table("test/subject_test.txt")

# Read from the Features text file and create a table of the data
featuresTable <- read.table('features.txt')

# view the the headers & data of the features Table
head(featuresTable)
View(featuresTable)


# Read data from the activity labels and create a table out of it.
activityLabelsTable = read.table('activity_labels.txt')

# View the the headers & data of the features Table
head(activityLabelsTable)
View(activityLabelsTable)

# Assign Column Names for the Training data
colnames(xTrain) <- featuresTable[,2] 
colnames(yTrain) <-"activityId"
colnames(subTrain) <- "subjectId"

# Assign Column Names for the Test data
colnames(xTest) <- featuresTable[,2] 
colnames(yTest) <-"activityId"
colnames(subTest) <- "subjectId"

# Assign Column Names to the activities table
colnames(activityLabelsTable) <- c('activityId','activityType')

# Now start merging the data for each of the sets of data - Training & Test
mergeTrainingDataSet <- cbind(yTrain, subTrain, xTrain)
mergeTestDataSet <- cbind(yTest, subTest, xTest)

# Use rbind to merge records from the Training & Test Data Sets into one data set.
AllMerged <- rbind(mergeTrainingDataSet, mergeTestDataSet)
colNames <- colnames(AllMerged)

# Create the variable to store the column names logic using the grepl function
meanAndStd <- (grepl("activityId" , colNames) | 
                   grepl("subjectId" , colNames) | 
                   grepl("mean.." , colNames) | 
                   grepl("std.." , colNames) )

# Calculate Mean & Standard Deviation for the columns from the Merged Data
MergedMeanAndStd <- AllMerged[ , meanAndStd == TRUE]

# Now merge the result of Mean & Standard Deviation with the universal merged data
MergedActivityNames <- merge(MergedMeanAndStd, activityLabelsTable, by='activityId', all.x=TRUE)

# Making a new tidy data set from the above merged result
TidyDataSet <- aggregate(. ~subjectId + activityId, MergedActivityNames, mean)

# Sort and order by subjectId & ActivityId
TidyDataSet <- TidyDataSet[order(TidyDataSet$subjectId, TidyDataSet$activityId),]

# Write the tidy data set as a new text file
write.table(TidyDataSet, "TidyDataSet.txt", row.name=FALSE)

