rm(list = ls())
data()
library(ade4)
data(package ="ade4")
data('doubs')
str(doubs)
write.csv(doubs$env,"data/doubs_env.csv")
mydata<-read.csv("data/doubs_env.csv")
head(mydata)
mydata<-mydata[,-1]
head(mydata)
hist(mydata$alt,
     col = "green",
     main = "altitude distribution",
     xlab = "altitude")
library(corrplot)
res1<-cor(mydata)
res1
write.table(res1,"results/coff.txt",sep="\t")
library(psych)
res2<-corr.test(mydata)
res2$r
res2$ci
corr_fig<-corrplot(res1)
pairs.panels(mydata[,2:6])
