## This script will perform the tasks assigned in the Getting and Cleaning Data ##Course Project
## Set the working directory.
setwd("~/Documents/Coursera/class3project")
## Download the appropriate zip file into your computer's working directory and extract files.
## Read the necessary test files into R.
## Read in subject_test.txt, y_test.txt, X_test.txt
## subject_test.txt
subject_test = read.table("/Users/Stephanie/Documents/Coursera/class3project/UCI HAR Dataset/test/subject_test.txt")
## y_test.txt
y_test = read.table("/Users/Stephanie/Documents/Coursera/class3project/UCI HAR Dataset/test/y_test.txt")
## X_test.txt
X_test = read.table("/Users/Stephanie/Documents/Coursera/class3project/UCI HAR Dataset/test/X_test.txt")
## Concatenate columns from subject_test.txt, y_test.txt, X_test.txt to make one data set
testbind <- cbind(subject_test, y_test, X_test)
head(testbind)
## This should give 2947 obs. of 563 variables
## Read in the features file and find which rows you need that you will then translate into columns in your 
## final dataframe.
features <- read.table("/Users/Stephanie/Documents/Coursera/class3project/UCI HAR Dataset/features.txt")
## Create a new data frame (testbindsub) that will only include the variable columns that we want to use 
## from the features.txt file. Those variables should only be associated with mean and standard deviation. 
## The data frame will also include the variable column from the subject_test file and the y_test file. 
##Subset from the testbind data frame.
testbindsub <- testbind[, c(1,2,3,4,5,6,7,8,43,44,45,46,47,48,83,84,85,86,87,88,123,124,125,126,127,128,163,
164,165,166,167,168,203,204,216,217,229,230,242,243,255,256,268,269,270,271,272,273,347,348,349,350,351,352,
426,427,428,429,430,431,505,506,518,519,531,532,544,545)]
## Read the necessary train files in R.
## Read in subject_train.txt, y_train.txt, X_train.txt
## subject_train.txt
subject_train = read.table("/Users/Stephanie/Documents/Coursera/class3project/UCI HAR Dataset/train/subject_train.txt")
## y_train.txt
y_train = read.table("/Users/Stephanie/Documents/Coursera/class3project/UCI HAR Dataset/train/y_train.txt")
## X_train.txt
X_train = read.table("/Users/Stephanie/Documents/Coursera/class3project/UCI HAR Dataset/train/X_train.txt")
## Concatenate columns from subject_train.txt, y_train.txt, X_train.txt to make one data set
trainbind <- cbind(subject_train, y_train, X_train)
head(trainbind)
## This should give 7352 obs. of 563 variables
## Go through the same subsetting process that was used on the testbind data frame to create a trainbindsub data 
## frame. From the trainbind data frame, subset out the variable columns that are associated with mean and standard 
##deviation, the subject_train variable column and the y_train variable columnn.
trainbindsub <- trainbind[, c(1,2,3,4,5,6,7,8,43,44,45,46,47,48,83,84,85,86,87,88,123,124,125,126,127,128,163,
164,165,166,167,168,203,204,216,217,229,230,242,243,255,256,268,269,270,271,272,273,347,348,349,350,351,352,
426,427,428,429,430,431,505,506,518,519,531,532,544,545)]
head(trainbindsub)
## Combine testbindsub and trainbindsub into one data frame. This should produce 10299 obs. of 68 variables.
testandtrain <- rbind(testbindsub, trainbindsub)
head(testandtrain)
## Read in the activity_labels.txt file
activities <- read.table("/Users/Stephanie/Documents/Coursera/class3project/UCI HAR Dataset/activity_labels.txt")
activityNames <- data.frame(activities)
## End of section 1
## Start section 2
## Check the reshape package in your Packages window.
library(reshape)
testandtrain$V1.1 <- factor(testandtrain$V1.1, levels = c(1,2,3,4,5,6), labels = c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"))
## Rename all column names
library(plyr)
testandtraindataframe <- rename(testandtrain, c(V1="ExperimentVolunteerID", V1.1="ActivityofVolunteer", V1.2="TimeBodyAccelerometerMeanX",
                                                V2="TimeBodyAccelerometerMeanY", V3="TimeBodyAccelerometerMeanZ", 
                                                V4="TimeBodyAccelerometerStandardDevX",
                                                V5="TimeBodyAccelerometerStandardDevY", 
                                                V6="TimeBodyAccelerometerStandardDevZ",
                                                V41="TimeGravityAccelerometerMeanX", 
                                                V42="TimeGravityAccelerometerMeanY",
                                                V43="TimeGravityAccelerometerMeanZ", 
                                                V44="TimeGravityAccelerometerStandardDevX",
                                                V45="TimeGravityAccelerometerStandardDevY", 
                                                V46="TimeGravityAccelerometerStandardDevZ",
                                                V81="TimeBodyAccelerometerJerkMeanX", 
                                                V82="TimeBodyAccelerometerJerkMeanY",
                                                V83="TimeBodyAccelerometerJerkMeanZ", 
                                                V84="TimeBodyAccelerometerJerkStandardDevX",
                                                V85="TimeBodyAccelerometerJerkStandardDevY", 
                                                V86="TimeBodyAccelerometerJerkStandardDevZ",
                                                V121="TimeBodyGyroscopeMeanX", V122="TimeBodyGyroscopeMeanY", 
                                                V123="TimeBodyGyroscopeMeanZ",
                                                V124="TimeBodyGyroscopeStandardDevX", 
                                                V125="TimeBodyGyroscopeStandardDevY",
                                                V126="TimeBodyGyroscopeStandardDevZ", 
                                                V161="TimeBodyGyroscopeJerkMeanX",
                                                V162="TimeBodyGyroscopeJerkMeanY", 
                                                V163="TimeBodyGyroscopeJerkMeanZ",
                                                V164="TimeBodyGyroscopeJerkStandardDevX", 
                                                V165="TimeBodyGyroscopeJerkStandardDevY",
                                                V166="TimeBodyGyroscopeJerkStandardDevZ", 
                                                V201="TimeBodyAccelerometerMagMean",
                                                V202="TimeBodyAccelerometerMagStandardDev", 
                                                V214="TimeGravityAccelerometerMagMean",
                                                V215="TimeGravityAccelerometerMagStandardDev", 
                                                V227="TimeBodyAccelerometerJerkMagMean",
                                                V228="TimeBodyAccelerometerJerkMagStandardDev", 
                                                V240="TimeBodyGyroscopeMagMean",
                                                V241="TimeBodyGyroscopeMagStandardDev", 
                                                V253="TimeBodyGyroscopeJerkMagMean",
                                                V254="TimeBodyGyroscopeJerkMagStandardDev", 
                                                V266="FrequencyBodyAccelerometerMeanX",
                                                V267="FrequencyBodyAccelerometerMeanY", 
                                                V268="FrequencyBodyAccelerometerMeanZ",
                                                V269="FrequencyBodyAccelerometerStandardDevX", 
                                                V270="FrequencyBodyAccelerometerStandardDevY",
                                                V271="FrequencyBodyAccelerometerStandardDevZ", 
                                                V345="FrequencyBodyAccelerometerJerkMeanX",
                                                V346="FrequencyBodyAccelerometerJerkMeanY", 
                                                V347="FrequencyBodyAccelerometerJerkMeanZ",
                                                V348="FrequencyBodyAccelerometerJerkStandardDevX", 
                                                V349="FrequencyBodyAccelerometerJerkStandardDevY",
                                                V350="FrequencyBodyAccelerometerJerkStandardDevZ", 
                                                V424="FrequencyBodyGyroscopeMeanX",
                                                V425="FrequencyBodyGyroscopeMeanY", 
                                                V426="FrequencyBodyGyroscopeMeanZ",
                                                V427="FrequencyBodyGyroscopeStandardDevX", 
                                                V428="FrequencyBodyGyroscopeStandardDevY",
                                                V429="FrequencyBodyGyroscopeStandardDevZ", 
                                                V503="FrequencyBodyAccelerometerMagMean",
                                                V504="FrequencyBodyAccelerometerMagStandardDev",
                                                V516="FrequencyBodyBodyAccelerometerJerkMagMean",
                                                V517="FrequencyBodyBodyAccelerometerJerkMagStandardDev",
                                                V529="FrequencyBodyBodyGyroscopeMagMean",
                                                V530="FrequencyBodyBodyGyroscopeMagStandardDev",
                                                V542="FrequencyBodyBodyGyroscopeJerkMagMean",
                                                V543="FrequencyBodyBodyGyroscopeJerkMagStandardDev"))
## Create a second, independent tidy data set with the average of each variable for each activity and each subject.
testandtraindataframe$average <- rownames(testandtraindataframe)
averageMelt <- melt(testandtraindataframe,id=c("ExperimentVolunteerID","ActivityofVolunteer"),
measure.vars=c("TimeBodyAccelerometerMeanX",
             "TimeBodyAccelerometerMeanY", "TimeBodyAccelerometerMeanZ", "TimeBodyAccelerometerStandardDevX",
             "TimeBodyAccelerometerStandardDevY", "TimeBodyAccelerometerStandardDevZ",
             "TimeGravityAccelerometerMeanX", "TimeGravityAccelerometerMeanY",
             "TimeGravityAccelerometerMeanZ", "TimeGravityAccelerometerStandardDevX",
             "TimeGravityAccelerometerStandardDevY", "TimeGravityAccelerometerStandardDevZ",
             "TimeBodyAccelerometerJerkMeanX", "TimeBodyAccelerometerJerkMeanY",
             "TimeBodyAccelerometerJerkMeanZ", "TimeBodyAccelerometerJerkStandardDevX",
             "TimeBodyAccelerometerJerkStandardDevY", "TimeBodyAccelerometerJerkStandardDevZ",
             "TimeBodyGyroscopeMeanX", "TimeBodyGyroscopeMeanY", "TimeBodyGyroscopeMeanZ",
             "TimeBodyGyroscopeStandardDevX", "TimeBodyGyroscopeStandardDevY",
             "TimeBodyGyroscopeStandardDevZ", "TimeBodyGyroscopeJerkMeanX",
             "TimeBodyGyroscopeJerkMeanY", "TimeBodyGyroscopeJerkMeanZ",
             "TimeBodyGyroscopeJerkStandardDevX", "TimeBodyGyroscopeJerkStandardDevY",
             "TimeBodyGyroscopeJerkStandardDevZ", "TimeBodyAccelerometerMagMean",
             "TimeBodyAccelerometerMagStandardDev", "TimeGravityAccelerometerMagMean",
             "TimeGravityAccelerometerMagStandardDev", "TimeBodyAccelerometerJerkMagMean",
             "TimeBodyAccelerometerJerkMagStandardDev", "TimeBodyGyroscopeMagMean",
             "TimeBodyGyroscopeMagStandardDev", "TimeBodyGyroscopeJerkMagMean",
             "TimeBodyGyroscopeJerkMagStandardDev", "FrequencyBodyAccelerometerMeanX",
             "FrequencyBodyAccelerometerMeanY", "FrequencyBodyAccelerometerMeanZ",
             "FrequencyBodyAccelerometerStandardDevX", "FrequencyBodyAccelerometerStandardDevY",
             "FrequencyBodyAccelerometerStandardDevZ", "FrequencyBodyAccelerometerJerkMeanX",
             "FrequencyBodyAccelerometerJerkMeanY", "FrequencyBodyAccelerometerJerkMeanZ",
             "FrequencyBodyAccelerometerJerkStandardDevX", "FrequencyBodyAccelerometerJerkStandardDevY",
             "FrequencyBodyAccelerometerJerkStandardDevZ", "FrequencyBodyGyroscopeMeanX",
             "FrequencyBodyGyroscopeMeanY", "FrequencyBodyGyroscopeMeanZ",
             "FrequencyBodyGyroscopeStandardDevX", "FrequencyBodyGyroscopeStandardDevY",
             "FrequencyBodyGyroscopeStandardDevZ", "FrequencyBodyAccelerometerMagMean",
             "FrequencyBodyAccelerometerMagStandardDev",
             "FrequencyBodyBodyAccelerometerJerkMagMean",
             "FrequencyBodyBodyAccelerometerJerkMagStandardDev",
             "FrequencyBodyBodyGyroscopeMagMean",
             "FrequencyBodyBodyGyroscopeMagStandardDev",
             "FrequencyBodyBodyGyroscopeJerkMagMean",
             "FrequencyBodyBodyGyroscopeJerkMagStandardDev"))
head(averageMelt)
## End of section 2
## Start section 3
## Now check reshape2 in your Packages window.
library(reshape2)
averageData <- dcast(averageMelt, ExperimentVolunteerID + ActivityofVolunteer ~ variable,mean)
head(averageData, n=20)
## This produces wide data. Write the output file.
write.table(averageData,"averageProjectData.txt",sep=",")
