## load library plyr
Data <-aggregate(. ~subject + activity, combineddata, mean)
Data <-Data[order(Data$subject,Data$activity),]
## write table
write.table(Data, file = "tidydata.txt",row.name=FALSE)