# Merges the training and the test sets to create one data set.
setwd("UCI HAR Dataset")
train <- read.table("train/X_train.txt", header=FALSE)
text <- read.table("test/X_test.txt", header=FALSE)
Data <- rbind(train, text)

train <- read.table("train/subject_train.txt", header=FALSE)
text <- read.table("test/subject_test.txt", header=FALSE)
subject <- rbind(train, text)

train <- read.table("train/y_train.txt", header=FALSE)
text <- read.table("test/y_test.txt", header=FALSE)
Labels <- rbind(train, text)


# Extracts only the measurements on the mean and standard deviation for each measurement. 
features <- read.table("features.txt")
meanStd <- grep("mean\\(\\)|std\\(\\)", features[, 2])
Data <- Data[, meanStd]
names(Data) <- features[meanStd, 2]


# Uses descriptive activity names to name the activities in the data set
activities <- read.table("activity_labels.txt")
Labels[,1] = activities[Labels[,1], 2]
names(Labels) <- "activity"

# Appropriately labels the data set with descriptive variable names. 
names(subject) <- "subject"
Together <- cbind(subject, Labels, Data)

# Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
uniqueSubjects = unique(subject)[,1]
numSubjects = length(unique(subject)[,1])
numActivities = length(activities[,1])
numCols = dim(Together)[2]
TidyData = Together[1:(numSubjects*numActivities), ]
row = 1
for (s in 1:numSubjects) {
  for (a in 1:numActivities) {
    TidyData[row, 1] = uniqueSubjects[s]
    TidyData[row, 2] = activities[a, 2]
    TSA <- Together[Together$subject==s & Together$activity==activities[a, 2], ]
    TidyData[row, 3:numCols] <- colMeans(TSA[, 3:numCols])
    row = row+1
  }
}
write.table(TidyData, "tidy_data_set.txt")
