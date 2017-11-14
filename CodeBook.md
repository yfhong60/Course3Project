# Code Book for Course 3 Getting and Cleaning Data Project Assignment

Authored by yfhong60

## Data Sources

Full description of the data can be found in the following link: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Project data can be found in the following link:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


## Data Cleaning and Processing Steps

When the script run_analysis.R is run, the following steps will be taken:

1. Merges the training and the test sets to create one data set.

2. Extracts only the measurements on the mean and standard deviation for each measurement.

3. Uses descriptive activity names to name the activities in the data set

4. Appropriately labels the data set with descriptive variable names.

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


## Variables

1. **X_test**: table contents of test/X_test.txt
2. **Y_test**: table contents of test/Y_test.txt
3. **subject_test**: table content of test/subject_test.txt
4. **X_train**: table contents of train/X_train.txt
5. **Y_train**: table contents of train/Y_train.txt
6. **subject_train**: table contents of train/subject_train.txt
7. **activity_labels**: table contents of activity_labels.txt
8. **features**: table contents of features.txt
9. **merge_test**: table contents of the merged table of subject_test, X_test, and Y_test
10. **merge_train**: table contents of the merged table of subject_train, X_train, and Y_train
11. **all_data**: table contents of the merged table of merge_train, merge_test
12. **index_features**: index that locates the mean and standard deviation for each measurement
13. **final_data**: table contents of mean and standard deviation for each measurement
14. **tidy_data**: table content of the average of each variable for each activity and each subject from final_data


## Output

**run_analysis. R**: an R script that can perform the cleaning and processing of data requested by the project.

**tidy_data.txt**: a data frame that contains only the average of each variable for each activity and each subject from the merged train and test data.
