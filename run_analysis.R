## Load package dplyr as the script uses some of its functions.
library(dplyr)

## All input files are present in the "UCI HAR Dataset" folder. This folder
## is in the working directory.
##Read the 3 test data input files
sub_test<-read.table("./UCI HAR Dataset/test/subject_test.txt",header=FALSE)
test_set <-read.table("./UCI HAR Dataset/test/X_test.txt",header=FALSE)
test_labels <-read.table("./UCI HAR Dataset/test/y_test.txt",header=FALSE)

##Read the 3 train data input files
sub_train<-read.table("./UCI HAR Dataset/train/subject_train.txt",header=FALSE)
train_set <-read.table("./UCI HAR Dataset/train/X_train.txt",header=FALSE)
train_labels <-read.table("./UCI HAR Dataset/train/y_train.txt",header=FALSE)

## Read activity label file
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt",header=FALSE)

## Read features file which has the variables names
features <- read.table("./UCI HAR Dataset/features.txt",header=FALSE)

##Merge train and test data
all_subjects<-rbind(sub_test,sub_train)
all_set <- rbind(test_set,train_set)
all_labels <- rbind(test_labels,train_labels)

## Apply column names to  the data set from features table
colnames(all_set) <-features$V2

## Rename column name of subjects table
colnames(all_subjects) <-"subjectID"

## Rename column name of labels table
colnames(all_labels) <-"activity"

## select mean and std columns
##Used grepl function which returns a logical vector
all_set<-all_set[,grepl("[Mm]ean\\(\\)|std\\(\\)",colnames(all_set))]

## Merge all data sets ie combine the subjects, activity lables and mean/std variables
all_data <-cbind(all_subjects,all_labels,all_set)

## Use descriptive activity names to name activties in the data set
all_data$activity[all_data$activity == 1] <- "WALKING"
all_data$activity[all_data$activity == 2] <- "WALKING_UPSTAIRS"
all_data$activity[all_data$activity == 3] <- "WALKING_DOWNSTAIRS"
all_data$activity[all_data$activity == 4] <- "SITTING"
all_data$activity[all_data$activity == 5] <- "STANDING"
all_data$activity[all_data$activity == 6] <- "LAYING"


## Appropriately label the data set with descriptive variable names
## Used gsub function to replace '-' with '.', 
##                    to remove brackets and
##                    to have one occurance of 'Body'
colnames(all_data) <- gsub('-','.',colnames(all_data)) 
colnames(all_data) <- gsub('\\(','',colnames(all_data)) 
colnames(all_data) <- gsub('\\)','',colnames(all_data)) 
colnames(all_data) <- gsub('BodyBody','Body',colnames(all_data))

                          
## Average of each variable for each activity and each subject                          
by_sub_activity <-group_by(all_data, subjectID, activity)

avg_data <- summarise_each(by_sub_activity,funs(mean))

##Format the data
formatTidyDataSet <- format(avg_data, digits=4, scientific=F, justify='right')

## Write the tidy data into a file
##tidy_data.txt will be present in the "UCI HAR Dataset" folder
write.table(formatTidyDataSet,"./UCI HAR Dataset/tidy_data.txt",row.names=FALSE,sep='\t', quote=FALSE)





