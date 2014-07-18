##====================
##1. Merges the training and the test sets to create one data set.

    ##read *.txt from /test folder first
    print("reading test data...")
    X_test<-read.table("UCI HAR Dataset/test/X_test.txt")
    subject_test<-read.table("UCI HAR Dataset/test/subject_test.txt")
    y_test<-read.table("UCI HAR Dataset/test/y_test.txt")
    
    ##bind subject_test and y_test data as new columns with X_testdata assign a new name with testdata
    testdata<-cbind(X_test,subject_test,y_test)
    
    ##do the same thing for /train folder
    print("reading train data...")
    X_train<-read.table("UCI HAR Dataset/train/X_train.txt")
    subject_train<-read.table("UCI HAR Dataset/train/subject_train.txt")
    y_train<-read.table("UCI HAR Dataset/train/y_train.txt")
    traindata<-cbind(X_train,subject_train,y_train)
    
    ##bind traindata as new rows with test data and merge them as one together named alldata
    print("merging test and train data into one dataset...")
    alldata<-rbind(testdata,traindata)


##====================
##2. Extracts only the measurements on the mean and standard deviation for each measurement. 
    
    ##read features.txt and filter those mean value features index 
    ##the feature index are corresponding to data's column numbers
    features<-read.table("UCI HAR Dataset/features.txt")
    extractcolumns<-grep("mean\\(\\)|std\\(\\)",features$V2)  
    
    ##add subject and activity columns and extract data from alldata
    extractdata<-alldata[,c(extractcolumns,c(562,563))]

##====================
##3. Uses descriptive activity names to name the activities in the data set
    ##read activity labels and add an new variable to the extracted data frame
    activitylab<-read.table("UCI HAR Dataset/activity_labels.txt")
    extractdata$Activity<-activitylab[extractdata$V1.2,2]
    

##====================
##4. Appropriately labels the data set with descriptive variable names. 
    extactnames<-sub("std\\(\\)","Std",sub("mean\\(\\)","Mean",gsub("-","",features[extractcolumns,2])))
    names(extractdata)<-c(extactnames,c("Subject","ActivityNo","Activity"))

##====================
##5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
    print("creating the tidy data and writing to tidydata.txt file...")
    meltdata<-melt(extractdata,id.vars=c(67,69),measure.vars=1:66)
    tidydata<-dcast(meltdata,Subject+Activity~variable,mean)
    write.table(tidydata,"tidydata.txt")
##could use read.table("tidydata.txt") to read in RStudio for view
    