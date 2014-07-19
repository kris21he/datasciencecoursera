==================================================================

#1.Prerequisite 
Make sure "reshape2" is installed as the scripts depends on that package melt() function

#2. Set up 
Put run_analysis.R file with assignment's unziped data folder("UCI HAR Dataset") 
under RStudio work directory.

#3. Run scripts 
Type source("run_analysis.R") in RStudio consle to run the script you would see as following:

[1] "reading test data..."
[1] "reading train data..."
[1] "merging test and train data into one dataset..."
[1] "creating the tidy data and writing to tidydata.txt file..."

#4. Check results
You would also see the tidydata.txt file created under the work directory
Type tidydata<-read.table("tydydata.txt") to view

The data set in tidydata is the final result created according to all the instructions from the assingment
The CodeBook.txt would explain the details for all the column names in tidydata table
Please refer to the comments and code for implementation details
