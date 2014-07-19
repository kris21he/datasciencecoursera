==================================================================

Put tun_analysis.R file with assignment's unziped data folder("UCI HAR Dataset") 
under a RStudio work directory.

install("reshape2") if have not installed this package, the run_analysis require this package's surpport

type source("run_analysis.R") in RStudio consle to run the script you would see as following:

[1] "reading test data..."
[1] "reading train data..."
[1] "merging test and train data into one dataset..."
[1] "creating the tidy data and writing to tidydata.txt file..."

you would also see the tidydata.txt file created under the work directory

type tidydata<-read.table("tydydata.txt") to view
The data set in tidydata is the final result created according to all the instructions from the assingment

The CodeBook.txt would explain the details for all the column names in tidydata table
