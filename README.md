# Module3_CourseProject
This is the readme file for the Coursera Data Science Module 3 Getting and Cleaning Data course project

## How to use the script
To use the script, first ensure the script is stored in your local machine. You may do this either by:
1. Fork the repository and clone it onto your local machine to a directory of your choice
2. Copy and paste the content of the script into a file named "run_analysis.R" that you may create on your local machine

Once you have the script in your local machine, you should:
1. Source the script "run_analysis.R" into R
2. Set the working directory to be the "UCI HAR Dataset" directory that came with the dataset zip pack downloaded from the course project. This is important as the script would not know where this directory is located in your local machine. The script is built based on the prerequisite that the working directory is set before it can be run successfully
3. Run the script by using the command: run_analysis()
4. The script may take some time to complete, depending on the processing speed of your local machine.
5. Once completed, a text file named "tidy_data.txt" will be created in the working directory, containing the tidy data set per step 5 of the course project


## What does the script do
The script does the following:
1. load the "dplyr" package.
2. read the data for features, activity label, training data set, test data set and the corresponding activity and subject data.
3. Merges the training and the test sets to create one data set.
4. Uses descriptive activity names to name the activities in the data set.
5. Extracts only the measurements on the mean and standard deviation for each measurement. 
6. Labels the data set with descriptive variable names. 
7. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
8. Writes the tidy data set into a text file on the local machine.
