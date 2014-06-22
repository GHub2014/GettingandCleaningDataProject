GettingandCleaningDataProject
=============================

This repository is dedicated to the Getting and Cleaning Data Course Project.
This script will perform the tasks assigned in the Getting and Cleaning Data Course Project. Please note that there are 3 different sections in this code that should be executed separately to account for the reshape and reshape2 packages. The code in Section 2 utilizes the reshape package. Section 2 utilizes the reshape2, but it can not be called until the third section as it will disrupt a function in the second section.

Set the working directory.

 setwd("~/Documents/Coursera/class3project")
 
#Section 1
Download the appropriate zip file into your computer's working directory and extract files. Read the necessary test files into R. Read in subject_test.txt, y_test.txt, X_test.txt. The code in Section 1 will read in the subject.txt, y_test.txt X_test.txt files and their columns together to make one data frame called testbind. This dataframe should display 2947 obs. of 563 variables.

This sections's code will then read in the features.txt file. Walk through this file and pick out the variables that deal with mean and standard deviation. There should be 66. With these 66 new variables, create a new data frame, using the testbind frame, that displays 68 columns (66 mean and std. dev. variables, the subject id, and the activity id.) A subsetting command will be used to create this data frame. That command looks like this: 

testbindsub <- testbind[, c(1,2,3,4,5,6,7,8,43,44,45,46,47,48,83,84,85,86,87,88,123,124,125,126,127,128,163,164,165,166,167,168,203,204,216,217,229,230,242,243,255,256,268,269,270,271,272,273,347,348,349,350,351,352,426,427,428,429,430,431,505,506,518,519,531,532,544,545)]

The code will now take care of the training files and use the same process that was used for the test files. Read in subject_train.txt, y_train.txt, and X_train.txt. Concatenate the columns from subject_train.txt, y_train.txt, X_train.txt to make one data frame called trainbind. This should give 7352 obs. of 563 variables
Go through the same subsetting process that was used on the testbind data frame to create a trainbindsub data frame. From the trainbind data frame, subset out the variable columns that are associated with mean and standard deviation, the subject_train variable column and the y_train variable columnn. That code will look like this: 

trainbindsub <- trainbind[, c(1,2,3,4,5,6,7,8,43,44,45,46,47,48,83,84,85,86,87,88,123,124,125,126,127,128,163,164,165,166,167,168,203,204,216,217,229,230,242,243,255,256,268,269,270,271,272,273,347,348,349,350,351,352,426,427,428,429,430,431,505,506,518,519,531,532,544,545)]

Section 1 will also combine testbindsub and trainbindsub into one data frame. This should produce 10299 obs. of 68 variables.

The next step is to use the activity_labels.txt file to describe the activity id elements. Read in the activity_labels.txt file and create a data frame.

#Section 2
In the Packages window in RStudo, "check" the box next to the reshape package and then use the library(reshape) command. Using this package we will use a factor command to change the activity ids to descriptive words. For example, we will change the number 2 to "WALKING_UPSTAIRS".

The next task in this section of code is to rename all of our column names. Currently, they are set at V1, V1.1, etc. Enter the library(plyr) command to enable the rename command. use this command to rename all columns. In example, we will rename V1 to "ExperimentVolunteerID".
                      
We now want to create a second, independent tidy data set with the average of each variable for each activity and each subject. We will use the rownames and melt functions to do this and will call the new data frame averageMelt. 
                                                                                                             
#Section 3
In you Packages window in RStudio, check the box next to reshape2 and call the library command to this package. We can now use the dcast command cast to find the mean of each variable for each activity and each subject/experiment volunteer. That command will look like this: averageData <- dcast(averageMelt, ExperimentVolunteerID + ActivityofVolunteer ~ variable,mean)

This produces wide data. I chose to use the wide dat format because you can easily find the average of each variable depending on the activity and subject. With this format, you can still customize it even further depending on what you would like to find out. For example, if I also want to simply find the average of all TimeBodyAccelerometerMeanX measurements for Experiment Volunteer 2, while performing the "WALKING_UPSTAIRS" activity, I can easily do that with this format because all of that information is listed and easy to find.

Write the output file.

write.table(averageData,"averageProjectData.txt",sep=",")
