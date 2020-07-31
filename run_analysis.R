library(dplyr)

# reading test data, including activity and subject
test <- read.table("./X_test.txt")
test_activ <- read.table("./y_test.txt", colClasses = "factor", col.names = "activity")
test_subject <- read.table("./subject_test.txt", colClasses = "factor", col.names = "subject")

# reading train data, including activity and subject
train <- read.table("./X_train.txt")
train_activ <- read.table("./y_train.txt",
                        colClasses = "factor", col.names = "activity")
train_subject <- read.table("./subject_train.txt",
                        colClasses = "factor", col.names = "subject")

# Merging activity test and train data, same for subject
activity_set <- rbind(test_activ, train_activ)
subject_set <- rbind(test_subject, train_subject)

# Mergind test and train data
dim(test)
dim(train)
data <- rbind(test, train)

# Extract the measurements on the mean and standard deviation.
feat <- read.table("features.txt")
feat2 <- grep("mean\\()$|std\\()$", feat[,2])
data <- data[,feat2]

# Save the feature labels for measurements names
feat_labels <- feat[feat2,][,2]
colnames(data) <- feat_labels

# Naming the activities in the data set
data$activity <- activity_set$activity
data$subject <- subject_set$subject
data$activity <- factor(data$activity, levels = c(1,2,3,4,5,6), 
                  labels =  c("walking","walking up","walking down",
                              "sitting","standing","laying"))

# Summarizing and creating tidy data set
data <- tbl_df(data)

# From the data set created, group by activity and subject to get the average
# of each variable for each activity and each subject
group_data <- (data 
    %>% group_by(activity, subject) 
    %>% summarise_if(is.numeric, mean, na.rm = TRUE)
    %>% print)

