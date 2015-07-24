run_analysis <- function() {
        
        # load dplyr library for later use
        library(dplyr)
        
        # read features.txt for the feature names. 
        # This will be used to label the variables later
        features <- read.table("features.txt")
        names(features) <- c("feature_id", "feature")
        
        # read activity labels. This will be used to label the activities later
        activity_labels <- read.table("activity_labels.txt")
        names(activity_labels) <- c("activity_id", "activity_label")
        
        # read the main data set and rename the variables with that from features
        xtrain <- read.table("train/X_train.txt")
        names(xtrain) <- features[["feature"]]
        xtest <- read.table("test/X_test.txt")
        names(xtest) <- features[["feature"]]
        
        # read the activity data set
        ytrain <- read.table("train/y_train.txt", col.names = "activity")
        ytest <- read.table("test/y_test.txt", col.names = "activity")
        
        # match the activity data set to that of activity label with the activity ID 
        # to obtain the activity label. 
        ytrain_label <- activity_labels[ytrain[,"activity"],"activity_label"]
        ytest_label <- activity_labels[ytest[,"activity"],"activity_label"]
        
        # append the activity label to the activity data set, introducing a new column
        ytrain <- cbind(ytrain, activity_label=ytrain_label)
        ytest <- cbind(ytest, activity_label=ytest_label)
        
        # read the subject data set
        subject_train <- read.table("train/subject_train.txt", col.names = "subject")
        subject_test <- read.table("test/subject_test.txt", col.names = "subject")
        
        # combine the subject data set, activity data set and feature data set into one
        data_train <- cbind(subject_train, ytrain, xtrain)
        data_test <- cbind(subject_test, ytest, xtest)
        
        # combine the training and test data set
        data_combine <- rbind(data_train, data_test)
        
        # extract the first 3 variables (subject, activity, activity_label) 
        # and the variables with name that contains "mean()" or "std()"
        # into a smaller data set
        data_combine <- data_combine[c(1:3, grep("mean()", names(data_combine), fixed=TRUE), grep("std()", names(data_combine), fixed=TRUE))]
        
        # rename the variables (apart from the first 3 variables) by appending "group_mean_"
        # to each of the variable name
        new_name <- paste("group_mean_", names(data_combine[-(1:3)]), sep="")
        names(data_combine) <- c(names(data_combine[1:3]), new_name)
        
        # creates a tidy data set with the average of each variable for each activity and each subject.
        data_mean <- aggregate(data_combine[-(1:3)], by=list(subject=data_combine$subject, activity_label=data_combine$activity_label), FUN=mean)
        
        # sort the tidy data set by subject, and then by activity_label
        data_mean <- arrange(data_mean, subject, activity_label)
        
        # write the tidy data set into a txt file
        write.table(data_mean, file="tidy_data.txt", row.names = FALSE)
        
}

