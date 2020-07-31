# Codebook
=========================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. Using this dataset, a new one The obtained dataset has been obtained in order to obtain average measurements for each variable.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

# Analysis
=========================================
To get a data set which summarizes the average of each variable for each activity and each subject, the train and test datasets were merged into one dataset, then only variables that end with "mean()" or "std()" were considered, meaning only those that calculate a general
mean and standard deviation. This new data set is summarized by activity performed and
subject. It has 18 measurements variables and the values obtained are the average for each activity and each subject.

# Variables
=========================================
# The new data set has 20 variables:

tBodyAccMag-mean(): Body linear acceleration time, mean
tBodyAccMag-std(): Body linear acceleration time, standard deviation
tGravityAccMag-mean(): Body linear acceleration magnitude time, mean
tGravityAccMag-std(): Body linear acceleration magnitude time, standard deviation
tBodyAccJerkMag-mean(): Accelerarion jerk magnitude time, mean
tBodyAccJerkMag-std(): Acceleration jerk magnitude time, standard deviation
tBodyGyroMag-mean(): Gyroscope magnitude time, mean
tBodyGyroMag-std(): Gyroscope magnitude time, standard deviation
tBodyGyroJerkMag-mean(): Gyroscope jerk magnitud time, mean
tBodyGyroJerkMag-std(): Gyroscope jerk magnitud time, standard deviation
fBodyAccMag-mean(): Body linear acceleration magnitude frequency, mean
fBodyAccMag-std(): Body linear acceleration magnitude frequency, standard deviation
fBodyBodyAccJerkMag-mean(): Acceleration jerk magnitude frequency, mean
fBodyBodyAccJerkMag-std(): Acceleration jerk magnitude frequency, standard deviation
fBodyBodyGyroMag-mean(): Gyroscope magnitude frequency, mean
fBodyBodyGyroMag-std(): Gyroscope magnitude frequency, standard deviation
fBodyBodyGyroJerkMag-mean(): Gyroscope jerk magnitud frequency, mean
fBodyBodyGyroJerkMag-std(): Gyroscope jerk magnitud frequency, standard deviation
activity: The activity performed by the subject. It can be walking, walking upstairs,
walking downstairs, sitting, standing and laying.
subject: ID of the subject.

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
=========================================

- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
