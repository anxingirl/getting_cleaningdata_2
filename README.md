getting_cleaningdata_2
======================
file:
'README.md' - YOU ARE HERE

'Codebook.md' - Description of how data was obtained from the original set,as well as a dictionary of variable names

'run_analysis.R' - an R language script that generates the tidy summary dataset from the original UCI HAR dataset, then saves the results to file. The various functions of the script are described throughout with comments. In addition to the output file, the script also generates the data frame "accel_data", a commpiled version of all the summary data in the original set (which is separated into 6 files there) with appropriate variable names

'Acceleration Data Summary.txt' - the final dataset containing the high-level summary described above. Data is in csv format and has a header of variable names
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

 run_analysis.R  does the following:
 
1.Merges the training and the test sets to create one data set.

2.Extracts only the measurements on the mean and standard deviation for each measurement. 

3.Uses descriptive activity names to name the activities in the data set

4.Appropriately labels the data set with descriptive variable names. 

5.Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 


