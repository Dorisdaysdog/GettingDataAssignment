
library(dplyr)

# Merges the training and the test sets to create one data set.
trainDF<-read.table("train/X_train.txt", header=FALSE)
testDF<-read.table("test/X_test.txt", header=FALSE)
trainDFy<-read.table("train/Y_train.txt", header=FALSE)
testDFy<-read.table("test/Y_test.txt", header=FALSE)
subject_train<-read.table("train/subject_train.txt", header=FALSE)
subject_test<-read.table("test/subject_test.txt", header=FALSE)

allTrain<-cbind(trainDF, trainDFy, subject_train)
allTest<-cbind(testDF, testDFy, subject_test)
allData<-rbind(allTrain,allTest)

features<-read.table("features.txt", header=FALSE)


# Extracts only the measurements on the mean and standard deviation for each measurement.
meanVars<-as.numeric(grep("mean",features[,2]))

stdVars<-as.numeric(grep("std",features[,2]))
bothVars<-c(meanVars,stdVars)
bothVars<-sort(bothVars)
thatData<-allData[c(bothVars,562,563)]
names(thatData)<-features[bothVars,2]
names(thatData)[80]<-'activity'
names(thatData)[81]<-'subject'

# Uses descriptive activity names to name the activities in the data set
activity<-read.table("activity_labels.txt", header=FALSE)
thatData$activity<-activity[thatData$activity,2]

# Appropriately labels the data set with descriptive variable names.

labels <- gsub("\\(\\)","", labels)

labels<-gsub("(-mean-X)$", "_mean_in_X", labels)
labels<-gsub("(-mean-Y)$", "_mean_in_Y", labels)
labels<-gsub("(-mean-Z)$", "_mean_in_Z", labels)
labels<-gsub("(-meanFreq-Z)$", "_meanFreq_in_Z", labels)
labels<-gsub("(-meanFreq-Y)$", "_meanFreq_in_Y", labels)
labels<-gsub("(-meanFreq-X)$", "_meanFreq_in_X", labels)
labels<-gsub("(-std-X)$", "_std_in_X", labels)
labels<-gsub("(-std-Y)$", "_std_in_Y", labels)
labels<-gsub("(-std-Z)$", "_std_in_Z", labels)

names(thatData)<-labels

# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

grouped<-thatData %>% group_by(activity, subject)
averaged<-grouped %>% summarise_each(mean)
