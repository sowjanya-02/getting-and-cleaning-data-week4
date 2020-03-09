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