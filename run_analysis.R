##downloading the file
##1.using url
projurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
##2.downloading file
download.file(projurl,destfile="./Dataset.zip")
##3.unzipping the folder
unzip(zipfile ="./Dataset.zip",exdir=".") 
##4. list total files in unzipped folder
list_files <- file.path("." , "UCI HAR Dataset")
files <-list.files(list_files, recursive=TRUE)
##5. read data from train and test folders before merging
YTest  <- read.table(file.path(list_files, "test" , "Y_test.txt" ),header = FALSE)
YTrain  <- read.table(file.path(list_files, "train" , "Y_train.txt" ),header = FALSE)
SubjectTest <- read.table(file.path(list_files, "test", "subject_test.txt"),header = FALSE)
SubjectTrain <- read.table(file.path(list_files, "train", "subject_train.txt"),header = FALSE)
XTest  <- read.table(file.path(list_files, "test" , "X_test.txt" ),header = FALSE)
XTrain  <- read.table(file.path(list_files, "train" , "X_train.txt" ),header = FALSE)
## adding test and train data to single file using rbind
X <- rbind(XTest,XTrain)
Y <- rbind(YTest,YTrain)
Subject <- rbind(SubjectTest,SubjectTrain)
## alloting names to varaibles
names(Subject) <- c("subject")
names(Y) <- c("activity")
XNames <- read.table(file.path(list_files, "features.txt"),head=FALSE)
names(X) <- XNames$V2
## combined all the data
combinesubjY <- cbind(Subject, Y)
combineddata <- cbind(X,combinesubjY)
## subdata for X names with observations mean or standard deviation
subsetXNames<- XNames$V2[grep("mean\\(\\)|std\\(\\)", XNames$V2)]
## subset data by selecting names of X
sNames<-c(as.character(subsetXNames), "subject", "activity" )
SelectedData<-subset(combineddata,select=sNames)
## selecting Y variables names from activity labels txt
YLabels <- read.table(file.path(list_files, "activity_labels.txt"),header = FALSE)
##prefix t is replaced by time
names(combineddata)<-gsub("^t", "time", names(combineddata))
## prefixf is replaced by frequency
names(combineddata)<-gsub("^f", "frequency", names(combineddata))
## Acc is relpaced with Accelerometer
names(combineddata)<-gsub("Acc", "Accelerometer", names(combineddata))
## Gyro is replaced with Gyroscope 
names(combineddata)<-gsub("Gyro", "Gyroscope", names(combineddata))
## Mag is replaced with Magnitude
names(combineddata)<-gsub("Mag", "Magnitude", names(combineddata))
## BodyBody is replaced with Body
names(combineddata)<-gsub("BodyBody", "Body", names(combineddata))
## for testing names(combineddata)
## load library plyr
Data <-aggregate(. ~subject + activity, combineddata, mean)
Data <-Data[order(Data$subject,Data$activity),]
## write table
write.table(Data, file = "tidydata.txt",row.name=FALSE)
