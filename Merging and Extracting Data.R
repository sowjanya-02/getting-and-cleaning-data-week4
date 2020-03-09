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
