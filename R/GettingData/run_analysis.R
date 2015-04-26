#first: read all the different files into R and merge them to a one single data frame

train <- read.table("x_train.txt")
trainLabel <- read.table("y_train.txt")
trainSubject <- read.table("subject_train.txt")

test <- read.table("x_test.txt")
testLabel <- read.table("y_test.txt")
testSubject <- read.table("subject_test.txt")

joinData <- rbind(train, test)
joinLabel <- rbind(trainLabel, testLabel)
joinSubject <- rbind(trainSubject, testSubject)

#Giving the names (labels to the variables)
features <- read.table("features.txt")
activity <- read.table("activity_labels.txt")
names(joinData) <- features[,2]
names(joinLabel) <- "activity"
names(joinSubject) <- "trainSubject"

#join the datasets into a one clean dataset
cleanedData <- cbind(joinSubject, joinLabel, joinData)

#Filtering the mean and standard deviation columns out of the dataset
meanAndStd <- grep("mean\\(\\)|std\\(\\)", names(cleanedData))

cleanedDataMS <- cleanedData[,c(1,2, meanAndStd)]

#Calculating the means for each of the subjects for each of the activities
#The count of subjects and activities
subjectCount <- length(table(joinSubject))
activityCount <- dim(activity)[1]

cleanedData2 <- data.frame()

row <- 1

  for (i in 1:subjectCount) {
    for (j in 1:activityCount) {
      subset <- cleanedDataMS[(cleanedData$trainSubject==i & cleanedDataMS$activity==j), ]
      newRow <- colMeans(subset)
      cleanedData2 <- rbind(cleanedData2, newRow)
      row <- row + 1
    }
  }

names(cleanedData2) <- names(cleanedDataMS)

#Write out the result
write.table(cleanedData2, "data_with_means.txt", row.name=FALSE)