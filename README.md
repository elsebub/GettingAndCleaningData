Coursera course rep

The run_analysis.R makes a tidy dataset of the raw data given in the project description.

The data given consists of six data files, and the files containg the names for variables. 
First the data is read into R with read.table commands.

"1. Merges the training and the test sets to create one data set." 
The trainning data is merged into the test data wits rbind commands (lines 11-13) Single dataframe called cleanedData is created n line 23 using cbind

"2. Extracts only the measurements on the mean and standard deviation for each measurement." 
Grep function is used to filter out the variable names including mean() and std() expressioins on line 26

"3. Uses descriptive activity names to name the activities in the data set." 
On rows 50-52 the number of activities are replaced with the factor names.

"4. Appropriately labels the data set with descriptive variable names. " 
On lines 15-20 distinctive names are given to the variables. Names are read from file for features.

"5. From the data set in step 4, creates a second, independent tidy data set with 
the average of each variable for each activity and each subject."
Rows 30-48 include the code for this step. A couple of for loops are used to go through the data and count column means.

The result is a tidy dataset with 68 variables and 180 rows.
