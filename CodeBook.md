### Code Book

## Variables

- subject - subject identifier of volunteer (1-30)
- activity - name of activity performed by subject (LAYING, SITTING, STANDING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS)

# The variables remaining are just the calculatd means and standard deviations: 

- TimeBodyAccelerometer.mean...X
- TimeBodyAccelerometer.mean...Y 
- TimeBodyAccelerometer.mean...Z 
- TimeGravityAccelerometer.mean...X
- TimeGravityAccelerometer.mean...Y
- TimeGravityAccelerometer.mean...Z
- TimeBodyAccelerometerJerk.mean...X 
- TimeBodyAccelerometerJerk.mean...Y
- TimeBodyAccelerometerJerk.mean...Z 
- TimeBodyGyroscope.mean...X
- TimeBodyGyroscope.mean...Y
- TimeBodyGyroscope.mean...Z
- TimeBodyGyroscopeJerk.mean...X
- TimeBodyGyroscopeJerk.mean...Y
- TimeBodyGyroscopeJerk.mean...Z 
- TimeBodyAccelerometerMagnitude.mean.. 
- TimeGravityAccelerometerMagnitude.mean.. 
- TimeBodyAccelerometerJerkMagnitude.mean..
- TimeBodyGyroscopeMagnitude.mean..
- TimeBodyGyroscopeJerkMagnitude.mean..
- FrequencyBodyAccelerometer.mean...X 
- FrequencyBodyAccelerometer.mean...Y 
- FrequencyBodyAccelerometer.mean...Z
- FrequencyBodyAccelerometer.meanFreq...X
- FrequencyBodyAccelerometer.meanFreq...Y
- FrequencyBodyAccelerometer.meanFreq...Z
- FrequencyBodyAccelerometerJerk.mean...X
- FrequencyBodyAccelerometerJerk.mean...Y
- FrequencyBodyAccelerometerJerk.mean...Z
- FrequencyBodyAccelerometerJerk.meanFreq...X
- FrequencyBodyAccelerometerJerk.meanFreq...Y
- FrequencyBodyAccelerometerJerk.meanFreq...Z 
- FrequencyBodyGyroscope.mean...X
- FrequencyBodyGyroscope.mean...Y
- FrequencyBodyGyroscope.mean...Z
- FrequencyBodyGyroscope.meanFreq...X
- FrequencyBodyGyroscope.meanFreq...Y
- FrequencyBodyGyroscope.meanFreq...Z
- FrequencyBodyAccelerometerMagnitude.mean..
- FrequencyBodyAccelerometerMagnitude.meanFreq..
- FrequencyBodyAccelerometerJerkMagnitude.mean..
- FrequencyBodyAccelerometerJerkMagnitude.meanFreq..
- FrequencyBodyGyroscopeMagnitude.mean..
- FrequencyBodyGyroscopeMagnitude.meanFreq..
- FrequencyBodyGyroscopeJerkMagnitude.mean.. 
- FrequencyBodyGyroscopeJerkMagnitude.meanFreq..
- angle.TimeBodyAccelerometerMean.gravity.
- angle.TimeBodyAccelerometerJerkMean..gravityMean.
- angle.TimeBodyGyroscopeMean.gravityMean.
- angle.TimeBodyGyroscopeJerkMean.gravityMean.
- angle.X.gravityMean.
- angle.Y.gravityMean.
- angle.Z.gravityMean.
- TimeBodyAccelerometer.std...X
- TimeBodyAccelerometer.std...Y
- TimeBodyAccelerometer.std...Z
- TimeGravityAccelerometer.std...X
- TimeGravityAccelerometer.std...Y 
- TimeGravityAccelerometer.std...Z
- TimeBodyAccelerometerJerk.std...X 
- TimeBodyAccelerometerJerk.std...Y
- TimeBodyAccelerometerJerk.std...Z 
- TimeBodyGyroscope.std...X
- TimeBodyGyroscope.std...Y
- TimeBodyGyroscope.std...Z
- TimeBodyGyroscopeJerk.std...X
- TimeBodyGyroscopeJerk.std...Y
- TimeBodyGyroscopeJerk.std...Z
- TimeBodyAccelerometerMagnitude.std..
- TimeGravityAccelerometerMagnitude.std..
- TimeBodyAccelerometerJerkMagnitude.std..
- TimeBodyGyroscopeMagnitude.std..
- TimeBodyGyroscopeJerkMagnitude.std..
- FrequencyBodyAccelerometer.std...X
- FrequencyBodyAccelerometer.std...Y
- FrequencyBodyAccelerometer.std...Z
- FrequencyBodyAccelerometerJerk.std...X
- FrequencyBodyAccelerometerJerk.std...Y
- FrequencyBodyAccelerometerJerk.std...Z
- FrequencyBodyGyroscope.std...X
- FrequencyBodyGyroscope.std...Y
- FrequencyBodyGyroscope.std...Z
- FrequencyBodyAccelerometerMagnitude.std..
- FrequencyBodyAccelerometerJerkMagnitude.std.. 
- FrequencyBodyGyroscopeMagnitude.std..
- FrequencyBodyGyroscopeJerkMagnitude.std..

## Transformations

1. Data was initially split into features, activity, and subject variables. That data was further split into either a test set or a train set. Data also contained an Activity Labels table and a Feature look up table

2. Read in all the data while assigning column names to each read in table. While doing this I used the col.names = featuresNames$functions when reading in the X_test and X_train data (a.k.a. the feature data) to yeild descriptive feature names. 

3. Once all the data was read in the first thing done was merging all the variables from the test and table sets into one main data set.

4. Next I extracted only the measurments on the mean and standard deviation for each measurment.

5. Used the Activity Labels lookup tale to yeild descriptive activity names for the activity variable.

6. Appropriately labeled the data set with descriptive variable names using gsub.

7. Then created a second, independent tidy data set with the average of each variable for each activity and each subject. To do this I used: tidyData <- mergedData %>%
    group_by(subject, activity) %>%
    summarise_all(funs(mean))

8. The dataset was then written into a tidyData.txt file using: write.table(tidyData, "tidyData.txt", row.name=FALSE)

## Data
#Copied from the README.txt 

Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit‡ degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

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

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.


