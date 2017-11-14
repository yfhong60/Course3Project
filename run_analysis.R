##Step Zero: Read in data
##read test data:
X_test <- read.table("test/X_test.txt")
Y_test <- read.table("test/Y_test.txt")
subject_test <- read.table("test/subject_test.txt")

##read train data:
X_train <- read.table("train/X_train.txt")
Y_train <- read.table("train/Y_train.txt")
subject_train <- read.table("train/subject_train.txt")

##read other data:
activity_labels <- read.table ("activity_labels.txt")
features <- read.table ("features.txt", stringsAsFactors = FALSE)[ ,2]



##Step One: Merges the training and the test sets to create one data set
merge_test <- cbind(subject_test, X_test, Y_test)
merge_train <- cbind(subject_train, X_train, Y_train)
all_data <- rbind(merge_train, merge_test)



##Step Two: Extracts only the measurements on the mean and standard deviation for each measurement
index_features <- grep(("mean\\(\\)|std\\(\\)"), features)
final_data <- all_data[ , c(1,2,index_features+2)]
colnames(final_data) <- c("Subject", "Activity", features[index_features])



##Step Three: Uses descriptive activity names to name the activities in the data set
final_data$Activity <- factor(final_data$Activity, levels = activity_labels[ , 1], labels = activity_labels[ , 2])



##Step Four: Appropriately labels the data set with descriptive variable names
names(final_data) <- gsub("\\()", "", names(final_data))
names(final_data) <- gsub("^t", "Time", names(final_data))
names(final_data) <- gsub("^f", "Frequence", names(final_data))
names(final_data) <- gsub("-mean", "Mean", names(final_data))
names(final_data) <- gsub("-std", "StandardDeviation", names(final_data))
names(final_data)<-gsub("Acc", "Accelerometer", names(final_data))
names(final_data)<-gsub("Gyro", "Gyroscope", names(final_data))
names(final_data)<-gsub("BodyBody", "Body", names(final_data))
names(final_data)<-gsub("Mag", "Magnitude", names(final_data))
names(final_data)<-gsub("tBody", "TimeBody", names(final_data))
names(final_data)<-gsub("angle", "Angle", names(final_data))
names(final_data)<-gsub("gravity", "Gravity", names(final_data))



##Step Five: From the data set in step 4, creates a second, independent tidy data set 
##with the average of each variable for each activity and each subject
library(data.table)
final_data$Subject <- as.factor(final_data$Subject)
final_data <- data.table (final_data)
tidy_data <- aggregate(. ~Subject+Activity, final_data, mean)
tidy_data <- tidy_data[order(tidy_data$Subject, tidy_data$Activity), ]
write.table(tidy_data, file = "tidy_data.txt", row.names = FALSE)

