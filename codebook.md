---
title: "Codebook for Course Project"
output: html_document
---
Peter Randazzo  
peter@ranbek.net  
prepared for Course Project, Getting and cleaning Data, January 2015


###Study Design
Original data sourced and transformed from provided
Human Activity Recognition Using Smartphones Dataset , Version 1.0.

Experiment notes from the original dataset:
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

This tidy dataset has been created upon request as a summarization of the original experimental data, with values containing the mean(s) of desired measurements, grouped by subject and by activity. All requested measurements are either calculated means or standard deviations. Other measurements were filtered as requested.

Each grouping, either by subject or by activity, is wholly contained on its own row. 

###The Dataset includes the following files:
* CodeBook.md : This file
* tidy_data.csv : Tidy Dataset , Comma Delimited, Header Row Included
* run_analysis.R : R Script that will recreate the tidy dataset from the original source data. Commented in detail
* README.md : Execution instructions for run_analysis.R

###Data Fields within tidy_data.csv
Each record has the following fields/structure:

**GROUPING FIELDS**
*The first two fields of each row denote the grouping for the averaged measurements in each row. In every row, either column 1 ("subject") or column 2 ("activity") are populated, but NOT both.* 

1. "activity" : Where present, denotes a summary record grouped by one of six activities:    
 + "WALKING"    
 + "WALKING_UPSTAIRS"    
 + "WALKING_DOWNSTAIRS"    
 + "SITTING"    
 + "STANDING"    
 + "LAYING"     

2. "subject" : Where present, denotes a summary record grouped by one of 30 subject volunteers    


**MEASURMENT FIELDS STRUCTURE**
*Values in all measurement fields are the means of the original measurements grouped by either subject or activity above. All measurement field names have the following structure and horizontal order:*

f{or}t | BodyAcc {or} GravityAcc {or} BodyGyro | Jerk | Mag | -mean() {or} -meanFreq() {or} -std() | -X {or} -Y {or} -Z  
-------|---------------------------------------|------|-----|--------------------------------------|-------------------  
Frequency Domain Signals {or} Time Domain Signals | Body Acceleration {or} Gravity Acceleration {or} Body Gyroscopic | Jerk Signals, if present | Magnitude, if present |Mean value {or} Weighted average of the frequency components to obtain a mean frequency {or} Standard deviation | X,Y,Z axis memasurements from accelerometer and gyroscope, if present 

**MEASURMENT FIELDS LIST**
*Each field utilizes the field structural naming convention above*    
3. "fBodyAcc-mean()-X"  
4. "fBodyAcc-mean()-Y"  
5. "fBodyAcc-mean()-Z"  
6. "fBodyAcc-meanFreq()-X"   
7. "fBodyAcc-meanFreq()-Y"   
8. "fBodyAcc-meanFreq()-Z"   
9. "fBodyAcc-std()-X"   
10."fBodyAcc-std()-Y"   
11. "fBodyAcc-std()-Z"   
12. "fBodyAccJerk-mean()-X"   
13. "fBodyAccJerk-mean()-Y"   
14. "fBodyAccJerk-mean()-Z"   
15. "fBodyAccJerk-meanFreq()-X"    
16. "fBodyAccJerk-meanFreq()-Y"    
17. "fBodyAccJerk-meanFreq()-Z"    
18. "fBodyAccJerk-std()-X"    
19. "fBodyAccJerk-std()-Y"    
20. "fBodyAccJerk-std()-Z"    
21. "fBodyAccMag-mean()"    
22. "fBodyAccMag-meanFreq()"    
23. "fBodyAccMag-std()"    
24. "fBodyAccJerkMag-mean()"    
25. "fBodyAccJerkMag-meanFreq()"    
26. "fBodyAccJerkMag-std()"    
27. "fBodyGyroJerkMag-mean()"    
28. "fBodyGyroJerkMag-meanFreq()"    
29. "fBodyGyroJerkMag-std()"    
30. "fBodyGyroMag-mean()"    
31. "fBodyGyroMag-meanFreq()"    
32. "fBodyGyroMag-std()"    
33. "fBodyGyro-mean()-X"   
34. "fBodyGyro-mean()-Y"   
35. "fBodyGyro-mean()-Z"         
36. "fBodyGyro-meanFreq()-X"   
37. "fBodyGyro-meanFreq()-Y"    
38. "fBodyGyro-meanFreq()-Z"    
39. "fBodyGyro-std()-X"    
40. "fBodyGyro-std()-Y"    
41. "fBodyGyro-std()-Z"    
42. "tBodyAcc-mean()-X"    
43. "tBodyAcc-mean()-Y"    
44. "tBodyAcc-mean()-Z"    
45. "tBodyAcc-std()-X"    
46. "tBodyAcc-std()-Y"    
47. "tBodyAcc-std()-Z"    
48. "tBodyAccJerk-mean()-X"    
49. "tBodyAccJerk-mean()-Y"    
50. "tBodyAccJerk-mean()-Z"    
51. "tBodyAccJerk-std()-X"    
52. "tBodyAccJerk-std()-Y"    
53. "tBodyAccJerk-std()-Z"    
54. "tBodyAccJerkMag-mean()"    
55. "tBodyAccJerkMag-std()"    
56. "tBodyAccMag-mean()"    
57. "tBodyAccMag-std()"    
58. "tBodyGyro-mean()-X"    
59. "tBodyGyro-mean()-Y"    
60. "tBodyGyro-mean()-Z"    
61. "tBodyGyro-std()-X"    
62. "tBodyGyro-std()-Y"    
63. "tBodyGyro-std()-Z"    
64. "tBodyGyroJerk-mean()-X"    
65. "tBodyGyroJerk-mean()-Y"    
66. "tBodyGyroJerk-mean()-Z"    
67. "tBodyGyroJerk-std()-X"    
68. "tBodyGyroJerk-std()-Y"    
69. "tBodyGyroJerk-std()-Z"    
70. "tBodyGyroJerkMag-mean()"    
71. "tBodyGyroJerkMag-std()"    
72. "tBodyGyroMag-mean()"    
73. "tBodyGyroMag-std()"    
74. "tGravityAcc-mean()-X"    
75. "tGravityAcc-mean()-Y"    
76. "tGravityAcc-mean()-Z"    
77. "tGravityAcc-std()-X"    
78. "tGravityAcc-std()-Y"    
79. "tGravityAcc-std()-Z"    
80. "tGravityAccMag-mean()"    
81. "tGravityAccMag-std()"    

**TRANSFORMATIONS**
*As commented in the run_analysis.R script, the following transformations were done in order to produce the tidy_data.csv output*

1. Data was imported from the following source files from the originating data set:   
 + activity_labels.txt   
 + features.txt   
 + subject_train.txt   
 + subject_test.txt   
 + y_train.txt   
 + y_test.txt   
 + x_train.txt   
 + x_test    
2. Feature names were copied and applied to column names from the features dataset to the x_test and x_train tables    
3. Activity labels were merged into the y_test and y_train tables    
4. A complete test data set was created by merging the x_test and y_test tables into a new data frame called m_test_data    
 + Field names were corrected from the merging process, removing x. prefixes from the id and activity fields   
5. A complete training data set was created by merging the x_train and y_train tables into a new data frame called m_train_data   
 + Field names were corrected from the merging process, removing x. prefixes from the id and activity fields   
6. A complete data set was created by merging the x_train and y_train tables into a new data frame called m_traintest   
7. As requested, a new data set was created with only the Mean and Standard Deviation Meaurements using the grep command. The new data set was called m_meansstd   
8. A melt table was created, melt_m_meansstd, from m_meansstd to facilitate further calculations of means grouped by activity and subject     
9. Using the d_cast functiion, means by subject and activity were created for each variable populated into new data frames, m_sub and m_act    
10. A new tidy dataset was created, m_tidy, from a rbind of the two melt tables m_sub and m_act    
+ During this process a blank activity column was added to m_sub and a blank sub_id column was added to m_act to facilitated binding   
+ During this process some renaming of columns momentarily occurred to facilitate the easy reording of columns    
11. Typos eight column names from the original source were corrected in m_tidy. An extra "Body" was removed:    
+ 'fBodyBodyAccJerkMag-mean()' was changed to 'fBodyAccJerkMag-mean()'    
+ 'fBodyBodyAccJerkMag-meanFreq()' was changed to 'fBodyAccJerkMag-meanFreq()'   
+ 'fBodyBodyAccJerkMag-std()' was changed to 'fBodyAccJerkMag-std()'    
+ 'fBodyBodyGyroJerkMag-mean()' was changed to 'fBodyGyroJerkMag-mean()'    
+ 'fBodyBodyGyroJerkMag-meanFreq()' was changed to 'fBodyGyroJerkMag-meanFreq()'    
+ 'fBodyBodyGyroJerkMag-std()' was changed to 'fBodyGyroJerkMag-std()'    
+ 'fBodyBodyGyroMag-mean()' was changed to 'fBodyGyroMag-mean()'   
+ 'fBodyBodyGyroMag-meanFreq()' was changed to 'fBodyGyroMag-meanFreq()'    
12. m_tidy was written out as a comma separated csv, tidy_data.csv, with no row names in the export directory.









