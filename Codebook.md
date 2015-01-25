#Codebook

###Tidy Data Steps followed:
1. <i>cbind</i> the "X_test.txt", "y_test.txt" and "subject_test.txt"
2. <i>cbind</i> the "X_train.txt", "y_train.txt" and "subject_train.txt"
3. <i>rbind</i> the datasets from step 1 and 2
4. extract labels from "features.txt" and make them valid R names with <i>make.names</i> function
5. remove ".", "..." with <i>gsub</> function
6. changes to variable names:
  <ul>
    <li>mean to Mean<li>
    <li>std to Std</li>
    <li>fBodyBody to fBody</li>
    <li>Acc to Acceleration</li>
    <li>t to Temperature<li>
    <li>f to Frequency</li>
    <li> Gyro to Gyroscope</li>
    <li>Mag to Magnitued</li>
</ul>

###This is a codebook for SummarizedData.txt file that is a result of the Course Project
