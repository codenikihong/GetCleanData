this file: CodeBook.md
--------------------------------------------------------
datasource:
dataset: UCI HAR Dataset
./test/X_test.txt"
./train/X_train.txt
./test/y_test.txt
./train/y_train.txt
./test/subject_test.txt
./train/subject_train.txt
./features.txt
./activity_labels.txt
--------------------------------------------------------
operations: 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
