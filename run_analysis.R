## Peer Assessment project for Getting and Cleaning Data
## --------------------------------------------------------------------
## set the current directory to the location where you unzip the 
## UCI HAR Dataset, all the data should be stored in this file directory
## require library "plyr"
## --------------------------------------------------------------------
## modify directory here
## rm(list=ls())
dir <- getwd() 
setwd(dir)

## read in test/traning data
## --------------------------------------------------------------------
x_test <- read.table("./test/X_test.txt")
x_train <- read.table("./train/X_train.txt")
y_test <- read.table("./test/y_test.txt")
y_train <- read.table("./train/y_train.txt")
subject_test <- read.table("./test/subject_test.txt")
subject_train <- read.table("./train/subject_train.txt")
features <- read.table("features.txt")
activities <- read.table("activity_labels.txt")

## merge test/traning data
## --------------------------------------------------------------------
x_total <- rbind(x_test,x_train)  # variables
colnames(x_total) <- features$V2  
y_total <- rbind(y_test,y_train)  # activity labels
colnames(y_total) <- "activity"
# replacing activity class with activity descriptions
library(plyr)
y_total$activity <- mapvalues(y_total$activity,from = activities$V1,
                              to = as.character(activities$V2))
subject_total <- rbind(subject_test,subject_train)
colnames(subject_total) <- "subject"
mergeddata <- cbind(subject_total,y_total,x_total)

## identify mean and std, only keep these columns in the merged data set
## --------------------------------------------------------------------
colpos <- grep("-mean[^a-zA-Z]+|-std[^a-zA-Z]+",names(mergeddata))
mergeddata <- mergeddata[,c(1,2,colpos)]

## calculate average values by subject and by activity
## --------------------------------------------------------------------
averagemat.by.activity <- t(sapply(split(mergeddata[,c(3:ncol(mergeddata))],mergeddata$activity),
       function(x) apply(x,2,mean)))
averagemat.by.subject <- t(sapply(split(mergeddata[,c(3:ncol(mergeddata))],mergeddata$subject),
                 function(x) apply(x,2,mean)))
rownames(averagemat.by.subject) <- paste0("subject-",1:nrow(unique(subject_total)))
## View(averagemat.by.subject)
output <- rbind(averagemat.by.activity,averagemat.by.subject)

## export the output table to average_by_activity_by_subject.txt in current directory
## --------------------------------------------------------------------
## write.csv(output, file = "average_by_activity_by_subject.csv")
write.table(output, "average_by_activity_by_subject.txt", sep="\t")
