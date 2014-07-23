The script *run_analysis.R*
===
0. Previus task
---------------
Before start the scrip we dowload the zipfile from [cloudfront.net](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)  and extrat it in the working directory, in a subdirectory called "UCI HAR Dataset"
1. Merges the training and the test sets to create one data set.
---------------
We read the data from the "train" and "test" folders and we merge the similiar frames: **Data** come from *x_t????.txt*, **Labels** fron *y_t????.txt*, and **sujets** from *subject_t????.txt*.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
---------------
From the file *features.txt* we take the names of the frame **Data** and select the **mean** and **standard deviation** for each measurement, then we Extract those measurements from **Data** frame and the associated names, in the new **Data** frame.
3. Uses descriptive activity names to name the activities in the data sett
---------------
We take the names of each activity from file *activity_labels.txt* and them we substitute the numeric data in the **Labels** vector with the descriptive names adding "activity" as the name.
4. Appropriately labels the data set with descriptive variable names. 
---------------
We add the name "subject" to the **subject** vector and after we join **subject** and **Labels** vectors with **Data** frame.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
---------------
With the use of *for* at two levels (one with the subjects and the second with activities) we calculate the average of each variable and the we build an data frame called **TidyData**. When this frame is complete we write a file called *tidy_data_set.txt*.

You can see [The *tidy_data_set.txt* Code book](https://github.com/PepeXavier/Getting_Data/blob/master/Codebook.md).
