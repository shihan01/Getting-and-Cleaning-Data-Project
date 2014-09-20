Xtrain<-read.table(file="./UCI HAR Dataset/train/X_train.txt",sep="")
Ytrain<-read.table(file="./UCI HAR Dataset/train/y_train.txt",sep="")
Strain<-read.table(file="./UCI HAR Dataset/train/subject_train.txt",sep="")
Xtest<-read.table(file="./UCI HAR Dataset/test/X_test.txt",sep="")
Ytest<-read.table(file="./UCI HAR Dataset/test/y_test.txt",sep="")
Stest<-read.table(file="./UCI HAR Dataset/test/subject_test.txt",sep="")
feat<-read.table(file="./UCI HAR Dataset/features.txt",sep="")
df<-rbind(Xtrain,Xtest)
names(df)<-feat[,2]
library(dplyr)
dff<-select(df,contains("mean"))
dff<-select(dff,-contains("meanFreq"))
dff<-select(dff,-contains("gravityMean"))
dff<-select(dff,-contains("tBodyAccMean,gravity"))
dfff<-select(df,contains("std"))
df1<-cbind(dff,dfff)
ds<-rbind(Strain,Stest)
da<-rbind(Ytrain,Ytest)
names(da)="V2"
df<-cbind(df1,ds,da)
df$V2[df$V2==1]<-"WALKING"
df$V2[df$V2==2]<-"WALKING_UPSTAIRS"
df$V2[df$V2==3]<-"WALKING_DOWNSTAIRS"
df$V2[df$V2==4]<-"SITTING"
df$V2[df$V2==5]<-"STANDING"
df$V2[df$V2==6]<-"LAYING"
name<-names(df)
name<-c(name, "Subject","Activity")
name<-name[name!="V1"]
name<-name[name!="V2"]
names(df)<-name
gsub<-group_by(df,Subject)
submean<-summarise_each(gsub,funs(mean))
gact<-group_by(df,Activity)
actmean<-summarise_each(gact,funs(mean))
names(submean)<-names(actmean)
submean<-as.data.frame(submean)
actmean<-as.data.frame(actmean)
ndf<-rbind(actmean,submean)
ndf<-select(ndf,-contains("Subject"))
write.table(ndf,file="./step5.txt",row.names=FALSE)
