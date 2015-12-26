
# Read in the data from the files
features <- read.table('features.txt',header=FALSE)
activityType <- read.table('activity_labels.txt',header=FALSE)
subjectTrain <- read.table('train/subject_train.txt',header=FALSE)
xTrain <- read.table('train/X_train.txt',header=FALSE)
yTrain <- read.table('train/y_train.txt',header=FALSE)
subjectTest <- read.table('test/subject_test.txt',header=FALSE)
xTest <- read.table('test/X_test.txt',header=FALSE)
yTest <- read.table('test/y_test.txt',header=FALSE)

# Assigin column names to the data imported above
colnames(activityType) <- c('activityId','activityType')
colnames(subjectTrain) <- "subjectId"
colnames(xTrain) <- features[,2] 
colnames(yTrain) <- "activityId"
colnames(subjectTest) <- "subjectId"
colnames(xTest) <- features[,2] 
colnames(yTest) <- "activityId"
colNames <- colnames(finalData)

#### 1. Merges the training and the test sets to create one data set.

# Create the final training set by merging subjectTrain, xTrain, and yTrain.
trainingData <- cbind(yTrain,subjectTrain,xTrain)

# Create the final test set by merging the subjectTest, xTest, and yTest.
testData <- cbind(yTest,subjectTest,xTest)

# Combine training and test data to create a final data set
finalData <- rbind(trainingData,testData)


#### 2. Extracts only the measurements on the mean and standard deviation for each measurement. 

# Create a vector that contains TRUE values for ID, mean, and stddev columns and FALSE for others
meansdVector <- (grepl("activity..",colNames) | grepl("subject..",colNames) | grepl("-mean..",colNames) & !grepl("-meanFreq..",colNames) & !grepl("mean..-",colNames) | grepl("-std..",colNames) & !grepl("-std()..-",colNames))

# Subset the desired columns
finalData <- finalData[meansdVector==TRUE]


#### 3. Uses descriptive activity names to name the activities in the data set.

# Merge the finalData set with the acitivityType table to include descriptive activity names
finalData <- merge(finalData,activityType,by='activityId',all.x=TRUE)

# Updating the colNames vector to include the new column names after merge
colNames <- colnames(finalData)


#### 4. Appropriately label the data set with descriptive variable names.

# Clean up the variable names
for (i in 1:length(colNames)) 
{
  colNames[i] <- gsub("\\()","",colNames[i])
  colNames[i] <- gsub("-std$","StdDev",colNames[i])
  colNames[i] <- gsub("-mean","Mean",colNames[i])
  colNames[i] <- gsub("^(t)","time",colNames[i])
  colNames[i] <- gsub("^(f)","freq",colNames[i])
  colNames[i] <- gsub("([Gg]ravity)","Gravity",colNames[i])
  colNames[i] <- gsub("([Bb]ody[Bb]ody|[Bb]ody)","Body",colNames[i])
  colNames[i] <- gsub("[Gg]yro","Gyro",colNames[i])
  colNames[i] <- gsub("AccMag","AccMagnitude",colNames[i])
  colNames[i] <- gsub("([Bb]odyaccjerkmag)","BodyAccJerkMagnitude",colNames[i])
  colNames[i] <- gsub("JerkMag","JerkMagnitude",colNames[i])
  colNames[i] <- gsub("GyroMag","GyroMagnitude",colNames[i])
}

# Reassigning the new descriptive column names to the finalData set
colnames(finalData) <- colNames


#### 5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.

# Create a new table, finalDataNoActivityType without the activityType column
finalDataNoActivityType <- finalData[,names(finalData) != 'activityType']

# Summarizing the finalDataNoActivityType table to include just the mean of each variable for each activity and each subject
tidyData <- aggregate(finalDataNoActivityType[,names(finalDataNoActivityType) != c('activityId','subjectId')],by=list(activityId=finalDataNoActivityType$activityId,subjectId = finalDataNoActivityType$subjectId),mean)

# Merging the tidyData with activityType to include descriptive acitvity names
tidyData <- merge(tidyData,activityType,by='activityId',all.x=TRUE)

# Export the tidyData set 
write.table(tidyData, 'tidyData.txt',row.names=FALSE, sep='')


