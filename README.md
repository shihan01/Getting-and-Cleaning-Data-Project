Using read.table to read in all needed data in file "train", file "test" and the "features.txt", speciy the sep="".

Using rbind to combine the rows of Xtrain and Xtest

Changing the names of new file by assigning the elements in file "feature.txt"

select the varibles that calculate mean 

select the varibles that calculate std 

Using the cbind to combine the selected ones.

Using rbind to combine the datas from train_subject and test_subject, y_test and y_train

Assigning the exact activity name to the data frame

Changing the names of the columns that formed by activity and subject.

Using group_by to group the data frame by subject and activity.

Using summarise-eahc to aculate the mean separately.

Using rbind to combine those 2 groups

Using write.table to output the data frame.
