#Getting and Cleaning Data Course Project

##Course Project Description
 You should create one R script called run_analysis.R that does the following. 

  1. Merges the training and the test sets to create one data set.
  2. Extracts only the measurements on the mean and standard deviation for each measurement. 
  3. Uses descriptive activity names to name the activities in the data set
  4. Appropriately labels the data set with descriptive variable names. 
  5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
 
Dataset source for the project:<br>
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

##Repository Content
This repository contains 3 files:<br>
1. README.md - information about steps followed for solving the course project.<br>
2. Codebook.md - codebook of a dataset variables along with information about data cleaning performed. <br>
3. run_analysis.R - R code that executes steps 1 to 5 with some short descriptions.<br>

##Steps followed for solving the course project

<b>Preliminary work</b> - Downloading and uzipping the data file from the url using R. Getting familiar with the datasets, looking through each file, getting information about the data it contains using <i>str()</i> and <i>summary()</i>.<br><br>
<b>Course Project Step1</b> - We have two file folders - "train" and "test". First step is to combine the "X", "y" and "subject" files into one dataset for both "train" and "test" results using <i>cbind</i>. "X", "y" and "subject" files in the "train" folder correspond to the "X", "y" and "subject" in the "test" folder because they represent different observations on same variables. Next step is to <i>rbind</i> the two combined datasets. As a result I ended up with one big dataset. This is a good moment to add column labels, so that I can easily navigate through it. Column names for X variables can be extracted from the "feautures.txt" file. The last two columns that come from "y" and "subject" files named "ActivityCode" and "Subject".<br><br>
<b>Course Project Step2</b> - Using <i>select</i> function from <i><b>dplyr</b></i> package have substracted all columns that have "mean" or "std" in their name. To the substracted dataset also included "ActivityCode" and "Subject" as we will need these two variables for next steps.<br><br>
<b>Course Project Step3</b> - The descriptive activity names are part of the original dataset. Read them from "activity_labels.txt" file in a data frame and labeled the two columns "ActivityCode" and "ActivityLabel". To avoid having upper case labels have set them all to lowercase with <i>tolower</i> function. Then using <i><b>plyr</i></b> <i>join</i> package have added a column to our tidied dataset with the corresponding "ActivityLabel" for each "ActivityCode". After this action we can drop "ActivityCode" as we have the necessary information as labels in "ActivityLabel" variable. <br><br> 
<b>Course Project Step4</b> -  Already did part of this step using the function <i>make.names</i>(which transformed all names from "features.txt" to valid R names, before assigning them to our dataset) when adding column names in Step1. To make them a bit easier to read have removed the "." and "..." which were left from <i>make.names</i> function. Have also changed some other specific words using <i>gsub</i> aiming for more explanatory variable names in camel case format.<br><br>
<b>Course Project Step5</b> - Using the <i><b>dplyr</i></b> <i>group_by</i> function have grouped the data by "ActivityLablel" and "Subject". Then with <i>summarise_each</i> calculated the average of each variable for each activity and each subject. Finally, we write the summarized dataset in seperate file.

##Notes
For reviewing the dataset from step5, you can use the following code:<br>
data <- read.table("./SummarizedData.txt", header = TRUE) <br>
View(data)

