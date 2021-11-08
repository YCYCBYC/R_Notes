## Control Structures
## if , else
## for , while
## repeat , break , next , return


TRUE & c(TRUE,FALSE, FALSE)    # [1]  TRUE FALSE FALSE
TRUE && c(TRUE, FALSE, FALSE)  # [1] TRUE
TRUE | c(TRUE, FALSE, FALSE)   # [1] TRUE TRUE TRUE
TRUE || c(TRUE, FALSE, FALSE)  # [1] TRUE

#  random numbers
sa <- sample(10)
#  check if has ...
any(sa)
any(sa<0)
all(sa)


#### if , else
x = 6
#  A type
if(x > 3) {
  y <- 1
} else {
  y <- 0
}
print(y)

# B type
y <- if(x < 3) {
  1
}else {
  0}
print(y)




#### for loop
i = 0
for(i in 1:10) {
    print(i - 1)
}

x <- c('a', 'b', 'c')
#  below are all same function
for(i in 1:4) print(x[i])

for(i in 1:3) {
    print(x[i])
}

for(i in 1:length(x)) {
    print(x[i])
}

for (i in seq_along(x)) {
    print(x[i])
}

for (anyvar in x) {
    print(anyvar)
}

# nested for loops
x <- matrix(1:6, 2, 3)
for(i in seq_len(ncol(x))){
    for(j in seq_len(nrow(x))){
    print(x[j, i])
    }
}




#### while 
count <- 0
while(count < 10) {
    print(count^2)
    count <- count + 1
}




#### repeat , break
repeat {
    print('ON')
    b = rbinom(1, 10, 0.5)
    if(b > 5){
      print('QUIT')
      break
    }
}




#### next , return
for(i in 1:10) {
    if(i <= 5) {
      next
    } else if(i >= 9) {
        return()
    }
    print(i)
}




#### R Function

#  add two number
add2 <- function(x,y) {
    x+y
}

# return numbers above 10 in a matrix
above10 <- function(x) {
    use <- x > 10
    x[use]
}
above10(matrix(1:20,4,5))

# column mean
colmean <- function(y) {
    nc <- ncol(y)  # number of columns
    means <- numeric(nc)  # create nc length vector with all 0
    for(i in 1:nc) {
        means[i] <- mean(y[,i])
    }
    means
}
colmean(matrix(1:10, 2, 5))


## A function has many arguments, some maybe null and default.
add3 <- function(a,b,c = NULL){
    if(is.null(c)) {c = 0}
    print(a+b+c)
}
add3(2,2)
add3(2,2,3)


## check args
args(cat)




#### Coding Standards

## use text files
## indent/tab the code
## limit the width of a line




#### Time and Date

## as.POSIct stores seconds since UNIX epoch (+some other data)
## as.POSIXlt, stores a list of day, month, year, hour, minute, second, etc

z1 <- Sys.time()
as.POSIXct(z1)
class(z1)

datestr <- c('October 31, 2021 11:30', 'Nov 1, 2021 9:30')
z2 <- strptime(datestr, '%B %d, %Y %H:%M')
z2
class(z2)

x <- as.POSIXlt(as.Date('2021-11-1'))
y <- strptime('Nov 1, 2021 9:30', '%B %d, %Y %H:%M')
y - x






