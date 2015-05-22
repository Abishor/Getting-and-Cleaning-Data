library(data.table)
library(plyr)

path <- getwd()
projectDirectory <- paste(path,"Project2015",sep="/")
# Set the work directory
if(!file.exists(projectDirectory)) {
    dir.create(projectDirectory, showWarnings = TRUE, recursive = FALSE, mode = "0777")
}

# Get the files
zipPath <- paste(projectDirectory,"UciData.zip",sep="/")
zipURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
if (!file.exists(zipPath)) {
    download.file(zipURL,destfile=zipPath,method="curl")
}
unzip(zipfile=zipPath,exdir=projectDirectory)

# Read the data
# y - activity
# x - features
featureNames <- read.table(paste(projectDirectory,"UCI HAR Dataset/features.txt",sep="/"))
activityLabels <- read.table(paste(projectDirectory,"UCI HAR Dataset/activity_labels.txt",sep="/"), header = FALSE)

subjectTrain <- read.table(paste(projectDirectory,"UCI HAR Dataset/train/subject_train.txt",sep="/"), header = FALSE)
yTrain <- read.table(paste(projectDirectory,"UCI HAR Dataset/train/y_train.txt",sep="/"), header = FALSE)
xTrain <- read.table(paste(projectDirectory,"UCI HAR Dataset/train/X_train.txt",sep="/"), header = FALSE)

subjectTest <- read.table(paste(projectDirectory,"UCI HAR Dataset/test/subject_test.txt",sep="/"), header = FALSE)
yTest <- read.table(paste(projectDirectory,"UCI HAR Dataset/test/y_test.txt",sep="/"), header = FALSE)
xTest <- read.table(paste(projectDirectory,"UCI HAR Dataset/test/X_test.txt",sep="/"), header = FALSE)

# [1] Merges the training and the test sets to create one data set
# add rows
subject <- rbind(subjectTrain, subjectTest)
activity <- rbind(yTrain, yTest)
features <- rbind(xTrain, xTest)

# Add friendly column name for the activity data
names(activity) <- "Activity"
# Add friendly column name for the subject data
names(subject) <- "Subject"


# [2] Extracts only the measurements on the mean and standard deviation for each measuremen
# grab the indexes for the columns
colsMeanStd <- grep("-(mean|std)", features[, 2])
# get only the columns of interest
features <- features[,colsMeanStd]

# [3] Uses descriptive activity names to name the activities in the data set
#replace the numbers with the text
activity[,1] <- activity[activityLabels[, 1], 2]

# [4] Appropriately labels the data set with descriptive variable names
# featureNames: e.g.
# 1 tBodyAcc-mean()-X
# 2    tBodyAcc-mean()-Y
# grab second column
names(features) <- t(featureNames[colsMeanStd,2])

# [5] From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject
combined <- cbind(features, activity, subject)
# Calculate means for all columns except for the last two (Activity & Subject). 
tidy <- ddply(combined, .(Subject, Activity), function(x) colMeans(x[, 1:length(colsMeanStd)]))

# Last, write the tidy.txt file, separate columns with a comma, containing the clean data set
write.table(tidy, file = paste(projectDirectory,"ResultData.txt",sep=","), row.names = FALSE)

