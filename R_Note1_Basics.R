print("This file was created in Rstudio")
print("And now it lives on GitHub")



## Main Data Science Questions
#  Descriptive:  Summarize data
#  Exploratory:  Find relationships that weren't known before
#  Inferential:  Sample -> Population
#  Predictive:   Current -> Future
#  Causal:       What happens to one variable when we manipulate another variable
#  Mechanistic:  Change in a variable -> exact change in another variable




#### DATA TYPE BEGIN ####

#  five basic objects: character, numeric(real numbers), integer, complex, logical(T/F)
#  vector can only keep objects of the same class
#  list can keep objects in different classes
#  factors
#  missing values
#  data frames
#  names


## Inf works in R
print(1/0)      # Inf
print(0/0)      # NaN
peint(Inf/Inf)  # NaN


## DATA TYPE - vector
v1 <- vector('logical', length = 4)
v2 <- vector('numeric', length = 8)
v1
v2


## paste
my_char <- c('My', 'name', 'is')
my_char
paste(my_char, collapse = " ")
paste(1:3, c('X', 'Y', 'Z'), sep = "")  # [1] "1X" "2Y" "3Z"
paste(1:6, c('X', 'Y', 'Z'), sep = "")  # [1] "1X" "2Y" "3Z" "4X" "5Y" "6Z"




## Explicit Coercion
x0 <- 0:6
print(x0)
x1 <- class(x0)
print(x1)
x2 <- as.numeric(x0)
print(x2)
x3 <- as.logical(x0)
print(x3)
x4 <- as.character(x0)
print(x4)


## DATA TYPE - Matrices
m <- matrix(nrow = 2, ncol = 3)
print(m)
# dim()
print(dim(m))
# cbind, rbind
v1 = 1:4
v2 = 4:1
v3 = cbind(v1, v2)
v4 = rbind(v1, v2)
print(v3)
print(v4)


## DATA TYPE - Factor
f0 <- factor(c('YC', 'YB', 'YC', 'YA', 'YA'), level = c('YA', 'YB', 'YC'))
print(f0)
print(table(f0))
print(unclass(f0))


## DATA TYPE - Missing Values
#  common judge
x = c(1, 2, NA, NaN, 5)
print(is.na(x))
print(is.nan(x))
# read file and judge
test1 = read.csv(file = '~/dataclean.csv', head = TRUE)
View(is.na(test1))

complete.cases(test1)
test1[complete.cases(test1), ]


## DATA TYPE - Data Frame
x <- data.frame(foo = 1:4, bar = c(T, F, F, F))
print(x)


## DATA TYPE - Names Attributes
rm(x)
x <- c(1, 2, 3, 4)
names(x)
names(x) <- c('A', 'B', 'C', 'F')
print(x)
names(x)


#### DATA TYPE END ####




#### READ DATA BEGIN ####

## Read (Large) Tabular Data
test2 <- read.table('dataclean.csv')


## Read Large Tables
test3 <- read.table('transtest.csv', nrows = 100, head = TRUE, sep = ',')
classes <- sapply(test3, class)


## Textual Data Formats


## Connections: Interface to the Outside World
#  r: read; w: write; a: appending
con <- file('dataclean.csv', 'r')
data<- read.csv(con)
close(con)

#### READ DATA END #### 




#### Subsetting BEGIN ####

## Subsetting Basics
x <- c('a', 'b', 'c', 'd', 'd', 'e')
x[1]
x[1:4]
x[c(-5, -6)]
x[-c(5, 6)]
x[x > 'b']

u = x > 'b'
print(u)  # [1] FALSE FALSE  TRUE  TRUE  TRUE  TRUE


## Subsetting List
x <- list(foo = 1:4, bar = 0.6, acc = c('hello', 'hi'))
x[1]    # $foo
        # [1] 1 2 3 4
x[[1]]  # [1] 1 2 3 4
x$bar   # [1] 0.6

name <- 'foo'
x[[name]]  # [1] 1 2 3 4
x$name     # NULL
x$foo      # [1] 1 2 3 4

x[[c(1,3)]]  # [1] 3
x[[c(2,1)]]  # [1] 0.6
x[[1]][[3]]  # [1] 3


## Subsetting Matrix
y <- matrix(1:8, 2, 4)
y[1, 2]  # [1] 3
y[1, ]   # [1] 1 3 5 7
y[1, , drop = FALSE]  # show the title 

my_vector <- 1:20
dim(my_vector) <- c(4,5)
my_vector

#  data frame
my_matrix <- matrix(1:20, nrow = 4, ncol = 5)
patients <- c('Bill', 'Gina', 'Kelly', 'Sean')
cbind(patients, my_matrix)
my_data <- data.frame(patients, my_matrix)

cnames <- c("patient", "age", "weight", "bp", "rating", "test")
colnames(my_data) <- cnames
my_data

## Partial Matching


## Removing Missing Values
baddata <- is.na(data)
cleandata <- data[!baddata]
gooddata <- complete.cases(data)  # gooddata is a logical indicator for each row
data[gooddata, ]  # only show good rows

#### Subsetting END ####







