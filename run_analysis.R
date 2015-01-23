     
##VARS & LIBS
library("plyr")
library("data.table")
library("reshape2")
fwidth = 16
tidy_dir= "UCI HAR Dataset/tidy"
tidy_file= "tidy_data.txt"

##MAKE WORKING DIRECTORY FOR TIDY DATA EXPORT
if (!file.exists(tidy_dir))
{
     dir.create(tidy_dir)
}

##LOAD FILES     
activity_labels <-read.csv("UCI HAR Dataset/activity_labels.txt", header=FALSE, sep=" ",col.names=c("a_id","activity"))
features <-read.csv("UCI HAR Dataset/features.txt", header=FALSE, sep=" ",col.names=c("feat_id","feature"))
subject_train <-read.csv("UCI HAR Dataset/train/subject_train.txt", header=FALSE, sep=" ",col.names=c("sub_id"))
subject_test <-read.csv("UCI HAR Dataset/test/subject_test.txt", header=FALSE, sep=" ",col.names=c("sub_id"))
y_train <-read.csv("UCI HAR Dataset/train/y_train.txt", header=FALSE, sep=" ",col.names=c("a_id"))
y_test <-read.csv("UCI HAR Dataset/test/y_test.txt", header=FALSE, sep=" ",col.names=c("a_id"))
x_train <- read.table("UCI HAR Dataset/train/x_train.txt", header=FALSE) 
x_test <- read.table("UCI HAR Dataset/test/x_test.txt", header=FALSE)


##FORMAT DATASET TABLES WITH PROPER COLUMN NAMES FROM FEATURES
featcol <- as.vector(features$feature) ##obtain column names for dataset
names(x_test) <- c(featcol)
names(x_train) <- c(featcol)

##APPEND ACTIVITY_LABELS TO Y TABLES
y_test <- merge(x = y_test, y = activity_labels, by = "a_id", all.x=TRUE)
y_train <- merge(x = y_train, y = activity_labels, by = "a_id", all.x=TRUE)

##Merge test data into 1 dataframe, adding src field for tracking
m_test_data <- cbind(x_test,(cbind(x = y_test, y = subject_test)))
m_test_data$src = "test"
names(m_test_data)[names(m_test_data) == 'x.activity'] <- 'activity'
names(m_test_data)[names(m_test_data) == 'x.a_id'] <- 'a_id'

##Merge train data into 1 dataframe, adding src field for tracking
m_train_data <- cbind(x_train,(cbind(x = y_train, y = subject_train)))
m_train_data$src = "train"
names(m_train_data)[names(m_train_data) == 'x.activity'] <- 'activity'
names(m_train_data)[names(m_train_data) == 'x.a_id'] <- 'a_id'

##Create merge of test and train data
m_traintest <- rbind(m_train_data, m_test_data)

##Create new Data Frame from merged dataset with only Only Mean and Standard Deviation Measurements
m_meansstd <- (m_traintest[,grep("mean()|std()|a_id|activity|sub_id|src",colnames(m_traintest))])

##Create melt Data Frame from merged dataset with only Only Mean and Standard Deviation Measurements
melt_m_meansstd<- melt(m_meansstd,id=c("activity","sub_id"),measure.vars=c(grep("mean()|std()",names(m_meansstd))))

##create means for each activity and each subject
m_sub <- dcast (melt_m_meansstd, sub_id ~ variable, mean)
m_act <- dcast (melt_m_meansstd, activity ~ variable, mean)

##Create new dataset of requested averages by activity and sub_id
m_sub$activity <- NA
m_act$sub_id <- NA
m_tidy <- rbind(m_sub, m_act)
names(m_tidy)[names(m_tidy) == 'sub_id'] <- 'aaa_subject'
names(m_tidy)[names(m_tidy) == 'activity'] <- 'aaa_activity'
m_tidy <- m_tidy[,order(names(m_tidy))]
names(m_tidy)[names(m_tidy) == 'aaa_subject'] <- 'subject'
names(m_tidy)[names(m_tidy) == 'aaa_activity'] <- 'activity'

##Names Clean Up
names(m_tidy)[names(m_tidy) == 'fBodyBodyAccJerkMag-mean()'] <- 'fBodyAccJerkMag-mean()'
names(m_tidy)[names(m_tidy) == 'fBodyBodyAccJerkMag-meanFreq()'] <- 'fBodyAccJerkMag-meanFreq()'
names(m_tidy)[names(m_tidy) == 'fBodyBodyAccJerkMag-std()'] <- 'fBodyAccJerkMag-std()'
names(m_tidy)[names(m_tidy) == 'fBodyBodyGyroJerkMag-mean()'] <- 'fBodyGyroJerkMag-mean()'
names(m_tidy)[names(m_tidy) == 'fBodyBodyGyroJerkMag-meanFreq()'] <- 'fBodyGyroJerkMag-meanFreq()'
names(m_tidy)[names(m_tidy) == 'fBodyBodyGyroJerkMag-std()'] <- 'fBodyGyroJerkMag-std()'
names(m_tidy)[names(m_tidy) == 'fBodyBodyGyroMag-mean()'] <- 'fBodyGyroMag-mean()'
names(m_tidy)[names(m_tidy) == 'fBodyBodyGyroMag-meanFreq()'] <- 'fBodyGyroMag-meanFreq()'


##export new tidy data set
tidy_file= paste(tidy_dir,tidy_file,sep='/')
write.table(m_tidy,tidy_file, sep=',', row.names=FALSE, ,na="")