#Codebook

##Variables from the tidy dataset
###ActivityLabel <br>
Values: walking, walking_upstairs, walking_downstairs,sitting, standing,laying<br>
type - character <br><br>
###Subject<br>
An identifier of the subject who carried out the experiment, range 1:30<br>
type - integer

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


