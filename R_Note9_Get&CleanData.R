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
testdata <- read.csv('transtest.csv', sep = ',', header = TRUE)

head(testdata, 6)
tail(testdata, 6)

summary(testdata[, 1:6])
str(testdata[, 1:6])

quantile(testdata[,6], na.rm = TRUE)
quantile(testdata[,6], na.rm = TRUE, probs = c(0.1, 0.2, 0.5))


## check missing values
sum(is.na(testdata$pov_idx))  # number of missing values
any(is.na(testdata$pov_idx))  # if there is missing values
mean(is.na(testdata$pov_idx))  # percentage of missing values


## row and column sum
colSums(testdata[, 6:10], na.rm = TRUE)
rowSums(testdata[1:10, 6:10], na.rm = TRUE)


## values with specific characteristics
table(testdata$STATE_NAME %in% 'Pennsylvania') # amount of records


## create new variables
s1 <- seq(1,10,by=2); s1
s2 <- seq(1,10, length=3); s2


## create binary variables
testdata$wrongZIP <- ifelse(testdata$GEOID < 15217000000, TRUE, FALSE)
table(testdata$smallZIP)
table(testdata$GEOID < 15217000000)


## create category variables
testdata$povgroup <- cut(testdata$pov_idx, breaks = quantile(testdata$pov_idx, na.rm = TRUE))
table(testdata$povgroup)


## common transforms
abs(x)
sqrt(x)
ceiling(x)
floor(x)
round(x, digits = 3)




#### reshape data ####
library(reshape2)
data(mtcars)
head(mtcars)


## melt
mtcars$carname <- rownames(mtcars)
mtcars1 <- melt(mtcars, id = c('carname','gear','cyl'), measure.vars = c('mpg','hp'))
head(mtcars1,3); tail(mtcars1,3)




#### dplyr package ####
library(dplyr)
testdata1 <- read.csv('transtest.csv')
str(testdata1)


## select columns
head(select(testdata1, 1:6))
head(select(testdata1, -(1:6)))


## filter rows
head(filter(testdata1, pov_idx > 90 & lbr_idx > 90), 10)


## arrange order
arrangebypov <- arrange(testdata1, pov_idx)
head(arrangebypov)

arrangebypov <- arrange(testdata1, desc(pov_idx))
head(arrangebypov)


## rename
testdata1 <- rename(testdata1, ZIPCODE = ï..GEOID)
head(testdata1, 2)


## mutate
testdata1 <- mutate(testdata1, new_idx = pov_idx - lbr_idx)
head(select(testdata1, ZIPCODE, new_idx))

testdata1 <- mutate(testdata1, povcat = factor(1 * (pov_idx < 80), labels = c('rich','poor')))
head(select(testdata1, ZIPCODE, pov_idx, povcat))


## join
df1 <- data.frame(id=sample(3:10), x=rnorm(8))
df2 <- data.frame(id=sample(1:8), y=rnorm(8))

full_join(df1, df2)
left_join(df1, df2)
right_join(df1, df2)
inner_join(df1, df2)


## merge data
## merge(datax, datay, by.x='', by.y='', all=TRUE)
df1 <- data.frame(ida=sample(3:10), x=rnorm(10))
df2 <- data.frame(idb=sample(1:8), y=rnorm(8))

testmerge <- merge(df1, df2, by.x='ida', by.y='idb')
head(testmerge)

testmerge2 <- merge(df1, df2)
head(testmerge2)


