#### Getting and Clean Data ####


## working directory
setwd('./Project 1')  # relative
setwd('C:/Users/ycycb/Documents/R_CourseraFiles')


## check file exist
file.exists('dataclean.csv')

if(!file.exists('dataset')){
    dir.create('dataset')
}


## get data from internet
fileURL <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv'
download.file(fileURL, destfile = './dataset/testdata.csv')
list.files('./dataset')
downloadDATE <- date()


## get local data
testdata <- read.csv('dataclean.csv', sep = ',', header = TRUE)
head(testdata)


## read Excel files
library(xlsx)
fileURL <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx'
download.file(fileURL, destfile = './dataset/getdata%2Fdata%2FDATA.gov_NGAP.xlsx')
testdata2 <- xlsx::read.xlsx(file = "getdata%2Fdata%2FDATA.gov_NGAP.xlsx", sheetIndex = 1, rowIndex = 18:23, colIndex = 7:15)
sum(testdata2$Zip*testdata2$Ext,na.rm=T)


## read XML
library(XML)


## read JSON
library(jsonlite)




#### data.table package ####
library(data.table)
df1 <- data.frame(x = rnorm(n=9, mean=10, sd=2), y = rep(c(1,2,3), each = 3))
df1

dt1 <- data.table(x = rnorm(n=9, mean=10, sd=2), y = rep(c(1,2,3), each = 3))
dt1


## check all tables
tables()  


## the first index will change, because it is a table
dt1[1, ]
dt1[c(2,3,4), ]
dt1[ ,c(1,2)]

## create new columns
dt1[ , z:=y^2]
dt1

dt1[ , w:={tmp <- (y+z); tmp+1}]
dt1

dt1[ , a:= x>10]
dt1

dt1[ , b:= a, by = a]
dt1




#### Clean Data ####

## setup data frame
x <- data.frame('var1'=sample(1:5), 'var2'=sample(6:10), 'var3'=sample(11:15))
x <- x[sample(1:5), ]
x$var2[c(1,3)] = NA
print(x)


## logicals ands and ors
x[(x$var1 <= 3 & x$var3 >= 11), ]
x[(x$var1 <= 3 | x$var3 >= 11), ]
x[which(x$var3 > 12), ]


## sort
sort(x$var1, decreasing = TRUE)
sort(x$var2, na.last = TRUE)


## order the data frame
x[order(x$var1), ]
x[order(x$var1,x$var2), ]

library(plyr)
arrange(x,var1)
arrange(x,desc(var3))


## add column
x$var4 <- rnorm(5)
x

x <- cbind(x, rnorm(5, mean=1))
names(x)[5] <- 'var5'
x




#### summarize data ####


head(testdata[, 1:4], 6)
tail(testdata[, 1:4], 6)

summary(testdata[, 1:4])
str(testdata[, 1:4])

quantile(testdata[,2], na.rm = TRUE)
quantile(testdata[,2], na.rm = TRUE, probs = c(0.1, 0.2, 0.5))


## check missing values
sum(is.na(testdata$SERIALNO))  # number of missing values
any(is.na(testdata$SERIALNO))  # if there is missing values
any(!is.na(testdata$SERIALNO))  # if there is no missing values
mean(!is.na(testdata$SERIALNO))  # percentage of missing values


## row and column sum
colSums(testdata[, 2:4])
rowSums(testdata[1:4, 2:4])


## values with specific characteristics
table(testdata$SERIALNO %in% c(835))
table(testdata$SERIALNO %in% c(835, 2120))  # amount of records with SERIALNO = 835 or 2120






