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