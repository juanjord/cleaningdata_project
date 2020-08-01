## **Files**

The package dplyr was used for cleaning and summarizing.In order to merge the train and test data in one data set, the first step consists in reading the files "X_test.txt" and "X_train.txt". Next, read the files "y_test.txt", "subject_test.txt", "y_train.txt", "subject_train.txt" to get the subject and activity column.

## **Reading and merging data**

In this case, the subject and the activity can be read as factor variables using 
colClasses = "factor" in the function.

Now the train and test data rows for the subject can be merged using rbind, and do the 
same for the activity column.

To merge the train and test data, rbind can be used here too. Just make sure that both
data frames have same number of columns and name (for now they are V1, V2, etc).

## **Extract measurements on the mean and standard deviation**

Now I have to extract the measurements on the mean and standard deviation, with the 
"features.txt" file. In this case, I am considering only the variables that ends with 
"mean()" or "std()". The features.txt file has two columns, the second one has the names
for these variables, so only this one matters.

This new data set now has only 18 variables, so now the feature labels can be saved for  
these 18 measurements names, in order to use them for the column names in the data set.

## **Giving descriptive variable names and activity names**

Now I only need the activity and subject columns, which were saved in the "activity_set"
and "subject_set" objects. In this case, these are both data frames, so I can use "$"
to add the activity and subject column in the data set.
With the factor() function, add the labels for the activity column, to use descriptive
activity names, instead of numbers.

## **Summarizing and creating tidy data set**

Now this new data set contains 20 columns in total, and now it can be summarized in
order to obtain the average of each variable for each activity and each subject.
First, group by activity and subject columns, then using the summarise_if function from
the dplyr package, to get the mean for the rest of the columns. In this case, the other
columns are measurements, and they are all numeric.

Finally, the average is obtained for each variable and the data set now has 180 rows
and 20 columns. This is a tidy data set (group_data in the R script) with headers, each variable has a different column,
and there are no duplicate columns.
