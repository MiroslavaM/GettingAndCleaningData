#Codebook

##Variables from the transformed (final) dataset
###ActivityLabel 
    type - character 
    Values: walking, walking_upstairs, walking_downstairs,sitting, standing,laying
    An identifier of the activity type
###Subject
    type - integer
    range: 1 - 30
    An identifier of the subject who carried out the experiment
###Measurement Means
    type - numeric
    featers variables
    Means of the measured feature variables for each activity and each subject. 
    (Features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. For more information about the data collection see "FeatureSelection" down the file).
    
TemperatureBodyAccelerationMeanX<br>
TemperatureBodyAccelerationMeanY<br>
TemperatureBodyAccelerationMeanZ<br>
TemperatureGravityAccelerationMeanX<br>
TemperatureGravityAccelerationMeanY<br>
TemperatureGravityAccelerationMeanZ<br>
TemperatureBodyAccelerationJerkMeanX<br>
TemperatureBodyAccelerationJerkMeanY<br>
TemperatureBodyAccelerationJerkMeanZ<br>
TemperatureBodyGyroscopeMeanX<br>
TemperatureBodyGyroscopeMeanY<br>
TemperatureBodyGyroscopeMeanZ<br>
TemperatureBodyGyroscopeJerkMeanX<br>
TemperatureBodyGyroscopeJerkMeanY<br>
TemperatureBodyGyroscopeJerkMeanZ<br>
TemperatureBodyAccelerationMagnituedMean<br>
TemperatureGravityAccelerationMagnituedMean<br>
TemperatureBodyAccelerationJerkMagnituedMean<br>
TemperatureBodyGyroscopeMagnituedMean<br>
TemperatureBodyGyroscopeJerkMagnituedMean<br>
FrequencyBodyAccelerationMeanX<br>
FrequencyBodyAccelerationMeanY<br>
FrequencyBodyAccelerationMeanZ<br>
FrequencyBodyAccelerationMeanFreqX<br>
FrequencyBodyAccelerationMeanFreqY<br>
FrequencyBodyAccelerationMeanFreqZ<br>
FrequencyBodyAccelerationJerkMeanX<br>
FrequencyBodyAccelerationJerkMeanY<br>
FrequencyBodyAccelerationJerkMeanZ<br>
FrequencyBodyAccelerationJerkMeanFreqX<br>
FrequencyBodyAccelerationJerkMeanFreqY<br>
FrequencyBodyAccelerationJerkMeanFreqZ<br>
FrequencyBodyGyroscopeMeanX<br>
FrequencyBodyGyroscopeMeanY<br>
FrequencyBodyGyroscopeMeanZ<br>
FrequencyBodyGyroscopeMeanFreqX<br>
FrequencyBodyGyroscopeMeanFreqY<br>
FrequencyBodyGyroscopeMeanFreqZ<br>
FrequencyBodyAccelerationMagnituedMean<br>
FrequencyBodyAccelerationMagnituedMeanFreq<br>
FrequencyBodyAccelerationJerkMagnituedMean<br>
FrequencyBodyAccelerationJerkMagnituedMeanFreq<br>
FrequencyBodyGyroscopeMagnituedMean<br>
FrequencyBodyGyroscopeMagnituedMeanFreq<br>
FrequencyBodyGyroscopeJerkMagnituedMean<br>
FrequencyBodyGyroscopeJerkMagnituedMeanFreq<br>
angletBodyAccelerationMeangravity<br>
angletBodyAccelerationJerkMeangravityMean<br>
angletBodyGyroscopeMeangravityMean<br>
angletBodyGyroscopeJerkMeangravityMean<br>
angleXgravityMean<br>
angleYgravityMean<br>
angleZgravityMean<br>
TemperatureBodyAccelerationStdX<br>
TemperatureBodyAccelerationStdY<br>
TemperatureBodyAccelerationStdZ<br>
TemperatureGravityAccelerationStdX<br>
TemperatureGravityAccelerationStdY<br>
TemperatureGravityAccelerationStdZ<br>
TemperatureBodyAccelerationJerkStdX<br>
TemperatureBodyAccelerationJerkStdY<br>
TemperatureBodyAccelerationJerkStdZ<br>
TemperatureBodyGyroscopeStdX<br>
TemperatureBodyGyroscopeStdY<br>
TemperatureBodyGyroscopeStdZ<br>
TemperatureBodyGyroscopeJerkStdX<br>
TemperatureBodyGyroscopeJerkStdY<br>
TemperatureBodyGyroscopeJerkStdZ<br>
TemperatureBodyAccelerationMagnituedStd<br>
TemperatureGravityAccelerationMagnituedStd<br>
TemperatureBodyAccelerationJerkMagnituedStd<br>
TemperatureBodyGyroscopeMagnituedStd<br>
TemperatureBodyGyroscopeJerkMagnituedStd<br>
FrequencyBodyAccelerationStdX<br>
FrequencyBodyAccelerationStdY<br>
FrequencyBodyAccelerationStdZ<br>
FrequencyBodyAccelerationJerkStdX<br>
FrequencyBodyAccelerationJerkStdY<br>
FrequencyBodyAccelerationJerkStdZ<br>
FrequencyBodyGyroscopeStdX<br>
FrequencyBodyGyroscopeStdY<br>
FrequencyBodyGyroscopeStdZ<br>
FrequencyBodyAccelerationMagnituedStd<br>
FrequencyBodyAccelerationJerkMagnituedStd<br>
FrequencyBodyGyroscopeMagnituedStd<br>
FrequencyBodyGyroscopeJerkMagnituedStd<br>

##Data Trasnformations
1. <i>cbind</i> the "X_test.txt", "y_test.txt" and "subject_test.txt"
2. <i>cbind</i> the "X_train.txt", "y_train.txt" and "subject_train.txt"
3. <i>rbind</i> the datasets from step 1 and 2
4. extract labels from "features.txt" and make them valid R names with <i>make.names</i> function
5. remove ".", "..." with <i>gsub</> function
6. changes to substrings (parts) of variable names, making them easier to read and more explanatory
  <ul>
    <li>"mean" to "Mean"</li>
    <li>"std" to "Std"</li>
    <li>"fBodyBody" to "fBody"</li>
    <li>"Acc" to "Acceleration"</li>
    <li>"^t" to "Temperature"</li>
    <li>"^f" to "Frequency"</li>
    <li>"Gyro" to "Gyroscope"</li>
    <li>"Mag" to "Magnitued"</li>
</ul>
7. change the column that contains the combined data from "y_test.txt" and "y_train.txt" to use the labels from "activity_labels.txt" in lowercase
8. as a result from steps 1 to 5 of the course project we ended up with a sumarized dataset with the average of each variable for each activity and each subject (180 observations on 88 variables).

##Feature Selection
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.<br><br> 
 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). <br> 
<br> 


Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).<br> 
<br> 
 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.<br> 
<br> 

##References
"features.info.txt" file - from the original dataset
