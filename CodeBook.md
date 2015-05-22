CodeBook - Getting and Cleaning Data

Goal: To describe:
	the variables
	the data
	the transformations[work]
performed to clean the data.

Data source:
	https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Data description:
	http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Data information:
	Research title: "Human Activity Recognition Using Smartphones Data Set"
	Input source: 30 volunteers, ages 19-48, wearing smartphones
	Input types: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
	Input technique: capture of 3-axial linear acceleration and 3-axial angular velocity through the embedded accelerometer and gyroscope
	Note: 70% of the volunteers was selected for generating the training data and 30% the test data

Record structure:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.
	
Data structure:
- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
The following files are available for the train and test data. Their descriptions are equivalent. 
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

REQUIREMENTS:
[1] Merges the training and the test sets to create one data set.
[2] Extracts only the measurements on the mean and standard deviation for each measurement. 
[3] Uses descriptive activity names to name the activities in the data set
[4] Appropriately labels the data set with descriptive variable names. 
[5] From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

