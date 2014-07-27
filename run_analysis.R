#convert number to activity name
activity_convert <- function(num){
	#get activity data frame 
	activity <- read.table("activity_labels.txt")
	if(num >0 && num < nrow(activity) ){
		ac <- activity[num,2]
		ac
	}	
}

uci_tidy <- function(){
#setwd to the file unpacked from the zip.
#setwd("UCI HAR Dataset")

#get data from test and train
X_train <- read.table("train/X_train.txt")
X_test <- read.table("test/X_test.txt")
Y_train <- read.table("train/Y_train.txt")
Y_test <- read.table("test/Y_test.txt")
subject_test <- read.table("test/subject_test.txt")
subject_train <- read.table("train/subject_train.txt")
features <- read.table("features.txt")


#	4.	Appropriately labels the data set with descriptive variable names. 
# it's easier and more convinient for latter processes to do this process early in this stage.

names(X_test) <- as.vector(features[,2])
names(X_train) <- as.vector(features[,2])
names(Y_train) <- c("Activity")
names(Y_test) <- c("Activity")
names(subject_test) <- c("subject")
names(subject_train) <- c("subject")

test <- cbind(subject_test, Y_test, X_test)
train <- cbind(subject_train, Y_train, X_train)

# 1.	   Merges the training and the test sets to create one data set.
test_train <- rbind(test,train)

#	2.	Extracts only the measurements on the mean and standard deviation for each measurement. 
mean_std <- grep("mean|std", names(test_train),ignore.case=FALSE)
test_train_mean_std <- test_train[,c(1,2,mean_std)]

#	3.	Uses descriptive activity names to name the activities in the data set
 test_train_mean_std_des <- mutate(test_train_mean_std,activity = activity_convert(Activity))

#	5.	Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
require(plyr)
clean_data<- ddply(test_train_mean_std, .(subject, Activity), colwise(mean))
 write.table(clean_data,"clean_data.csv",sep=",",row.names=FALSE)

}