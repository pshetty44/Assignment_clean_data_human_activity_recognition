=========================================================================================================================
Project name:

Human Activity Recognition Using Smartphones Dataset
=========================================================================================================================
Project description:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person
performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone
(Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration
and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually.
The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the
training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width
sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational
and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The
gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was
used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See
'features_info.txt' for more details. 

=========================================================================================================================
Description of raw datasets present in the UCI HAR Dataset folder:

The follwing raw datasets are used by the script.
- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range isfrom 1 to 30. 


- 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 


Please note that the test and the train datasets also includes the inertial signals data sets.  It includes 3 signals each on
X, Y and Z axis.
We dont use this data directly in the script.

=========================================================================================================================
Scope of the script:

Summarizing the mean and standard deviation (std) measurements per subject per activity by using the input dataset mentioned above.

=========================================================================================================================
Prerequisites:Make sure the dplyr package is installed.

=========================================================================================================================
Step by step details on what the script does:

- The script reads the following input files
  a) subject_test.txt
  b) X_test.txt
  c) y_test.txt
  d) subject_train.txt
  e) X_train.txt
  f) y_train.txt
  g) activity_labels.txt
  h) features.txt

- It then merges the train and the test data. Example: subject_test.txt and subject_train.txt is merged to form one data set called all_subjects

- The script asigns variable names from the features file to the test data.

- It gives an appropriate column names to the subject and activity data.

- It then selects the requested columns form the data set ie mean and standrad deviation columns.

- It then combines the subject, activity and the mean/std variables together into one dataset.

- The script uses descriptive activity names to name activties in the data set.

- The script then uses the gsub function to appropriately label the data set with descriptive variable names. It does the following 3 things:
  a) replace '-' with '.'
  b) remove brackets and
  c) replaces multiple occurances of 'Body' with one.
  By doing the above 3 operations, you see a tidier data.

- The average of each variable is calculated for each subject and each activity.

- The final tidy dataset is formatted and written into a file called "tidy_data.txt". Please refer CodeBook.md file for the column descriptions of the tidy data set.

=========================================================================================================================
Location of the input and output files:

Please copy the run_analysis.R in your working directory.

The script will work under the assumption that the folder "UCI HAR Dataset" is present in your working directory. 
Inside the "UCI HAR Dataset" folder, there needs to be 2 subfolders called test and train that contains the respective test and the training
input files. The features.txt and the activity_labels.txt should be present inside "UCI HAR Dataset" folder.
 
The tidy output file will also be written to "UCI HAR Dataset" folder under the name tidy_data.txt. The file can be read again
by using the below command.
tidy_data <- read.table("./UCI HAR Dataset/tidy_data.txt",header=TRUE)

=========================================================================================================================




