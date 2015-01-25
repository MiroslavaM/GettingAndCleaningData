#Loading plyr and dplyr packages
library(plyr)
library(dplyr)

##Check to see if the directory exists and if doesn't create it
if (!file.exists("./cpdata")){
    dir.create("./cpdata")
}

##Check to see if the file exists and if doesn't downoload and extract it.
if (!file.exists("./cpdata/UCI HAR Dataset")){
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL, destfile="cpdata/UCIHARdata.zip")
unzip("cpdata/UCIHARdata.zip", exdir="cpdata")
}

##Set the working directory to be the file directory
setwd("./cpdata/UCI HAR Dataset")

##Read the x, y and subject files from test folder
dtTestX <- read.table("./test/X_test.txt")
dtTestY <- read.table("./test/y_test.txt")
dtTestSubject <- read.table("./test/subject_test.txt")
    
##Read the x, y and subject files from train folder
dtTrainX <- read.table("./train/X_train.txt")
dtTrainY <- read.table("./train/y_train.txt")
dtTrainSubject <- read.table("./train/subject_train.txt")

##Merge the test and train datasets with cbind
dtCombTest <- cbind(cbind(dtTestX, dtTestY), dtTestSubject)
dtCombTrain <- cbind(cbind(dtTrainX, dtTrainY), dtTrainSubject)

##Merge the test and train combined datasets in one dataset with rbind.
dtCombAll <- rbind(dtCombTest, dtCombTrain)

##Adding the names to the combined dataset
dtNames <- read.table("./features.txt", stringsAsFactors = FALSE)
dtNames <- rbind(rbind(dtNames, c(562, "ActivityCode")), c(563, "Subject"))
allNames <- dtNames[,2]
colnames(dtCombAll) <- make.names(dtNames[,2], unique = TRUE) 

##Extract only the measurements on the mean and standard deviation for each measurement.
##Also include ActivityCode and Subject as we will need them for next steps
dtCombAll <- tbl_df(dtCombAll)
dtTidy <- select(dtCombAll, contains("mean"), contains("std"), ActivityCode, Subject)

##Use descriptive activity names to name the activities in the data set
actLabels <- read.table("./activity_labels.txt", stringsAsFactors = FALSE)
colnames(actLabels) <- c("ActivityCode", "ActivityLabel")
actLabels[ ,2] <- tolower(actLabels[ ,2])
dtTidy <- join(dtTidy, actLabels, by = "ActivityCode")

##Cleaning the dataset by removing the ActivityCode as we have the labeled info in ActivityLabel
dtTidy <- select(dtTidy, - ActivityCode)

##Appropriately label the data set with descriptive variable names. 
##We already did part of this using the function make.names (line 41), which transformed all names from features.txt to valid R names, before assigning them to our dataset. 
##Remove the "..." and make the names in camel case (e.g. easier for reading) and more explanatory
colnames(dtTidy) <- gsub("[/././.]", "", colnames(dtTidy))
colnames(dtTidy) <- gsub("mean", "Mean", colnames(dtTidy))
colnames(dtTidy) <- gsub("std", "Std", colnames(dtTidy))
colnames(dtTidy) <- gsub("fBodyBody", "fBody", colnames(dtTidy)) 
colnames(dtTidy) <- gsub("Acc", "Acceleration", colnames(dtTidy))
colnames(dtTidy) <- gsub("^t", "Temperature", colnames(dtTidy))
colnames(dtTidy) <- gsub("^f", "Frequency", colnames(dtTidy))
colnames(dtTidy) <- gsub("Gyro", "Gyroscope", colnames(dtTidy))
colnames(dtTidy) <- gsub("Mag", "Magnitued", colnames(dtTidy))

##From the Tidy dataset, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
dtSummarize <- 
    dtTidy %>% 
    group_by(ActivityLabel, Subject) %>%
    summarise_each(funs(mean))

print(dtSummarize)

#Save the summarized dataset in a .txt file
write.table(dtSummarize, file="SummarizedData.txt", row.names=FALSE)