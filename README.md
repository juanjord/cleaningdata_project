# The package dplyr was used for cleaning and summarizing.

# In order to merge the train and test data in one data set, the first step consists in
reading the files "X_test.txt" and "X_train.txt". Next, read the files "y_test.txt", "subject_test.txt", "y_train.txt", "subject_train.txt" to get the subject and activity
column.

# Reading data
# In this case, the subject and the activity can be read as factor variables using 
# colClasses = "factor" in the function.

test <- read.table("./X_test.txt")
test_activ <- read.table("./y_test.txt", colClasses = "factor", col.names = "activity")
test_subject <- read.table("./subject_test.txt", colClasses = "factor", col.names = "subject")

train <- read.table("./X_train.txt")
train_activ <- read.table("./y_train.txt",
                        colClasses = "factor", col.names = "activity")
train_subject <- read.table("./subject_train.txt",
                        colClasses = "factor", col.names = "subject")

# Now the train and test data rows for the subject can be merged using rbind, and do the 
# same for the activity column.
activity_set <- rbind(test_activ, train_activ)
subject_set <- rbind(test_subject, train_subject)

# To merge the train and test data, rbind can be used here too. Just make sure that both
# data frames have same number of columns and name (for now they are V1, V2, etc).
dim(test)
dim(train)
data <- rbind(test, train)

# Now I have to extract the measurements on the mean and standard deviation, with the 
# "features.txt" file. In this case, I am considering only the variables that ends with 
# "mean()" or "std()". The features.txt file has two columns, the second one has the names
# for these variables, so only this one matters.

feat <- read.table("features.txt")
head(feat)
feat2 <- grep("mean\\()$|std\\()$", feat[,2])

# Using grep function to find the matching variables, then "feat2" can be used as a filter
# for the data set.
data <- data[,feat2]

# This new data set now has only 18 variables, so now I can save the feature labels for  
# these 18 measurements names, in order to use them for the column names in the data set.

feat_labels <- feat[feat2,][,2]
colnames(data) <- feat_labels
head(names(data))

# Now I only need the activity and subject columns, which were saved in the "activity_set"
# and "subject_set" objects. In this case, these are both data frames, so I can use "$"
# to add the activity and subject column in the data set.
# With the factor() function, add the labels for the activity column, to use descriptive
# activity names, instead of numbers.

data$activity <- activity_set$activity
data$subject <- subject_set$subject
data$activity <- factor(data$activity, levels = c(1,2,3,4,5,6), 
                  labels =  c("walking","walking up","walking down",
                              "sitting","standing","laying"))
data <- tbl_df(data)

# Now this new data set contains 20 columns in total, and now it can be summarized in
# order to obtain the average of each variable for each activity and each subject.
# First, group by activity and subject columns, then using the summarise_if function from
# the dplyr package, to get the mean for the rest of the columns. In this case, the other
# columns are measurements, and they are all numeric.
group_data <- (data 
    %>% group_by(activity, subject) 
    %>% summarise_if(is.numeric, mean, na.rm = TRUE)
    %>% print)
    
# Finally, the average is obtained for each variable and the data set now has 180 rows
and 20 columns. This is a tidy data set with headers, each variable has a different column,
and there are no duplicate columns.