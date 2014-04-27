GetCleanData
============

Peer Assignment for Getting and Cleaning Data

explationary comments for run_analysis.R

1. set directory of UCI HAR Dataset file to dir variable, default value is current working directory. Make sure that UCI HAR Dataset file the same file zipped from getdata-projectfiles-UCI HAR Dataset.zip. Otherwise the script won't locate data files correctly.
2. This program will only extract the mean and standard deviation of measurements in test/training set.
3. The output file is named "average_by_activity_by_subject.csv", each row represent the average of each variable for each activity/each subject.
