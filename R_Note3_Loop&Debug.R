#### R_Note3_Loop & Debug

## lapply : Loop over a list and evaluate a function on each element
## sapply : Same as lapply but to simplify the result
## apply  : Apply a function over the margins of an array
## tapply : Apply a function ober subsets of a vector
## mapply : Multivariate version of lapply




#### lapply

x <- list(a = 1:5, b = rnorm(100,1), c = rnorm(100, 3))  # create a list
lapply(x, mean)  # return a list

y <- 1:3
lapply(y, runif, min = 0, max = 2)




#### sapply
## if result is a list with all elements in length 1, return a vector
## if result is a list with all elements in same length, return a matrix
## if not, return a list

x <- list(a = 1:5, b = rnorm(100,1), c = rnorm(100, 3))  # create a list
sapply(x, mean)  # return a list

y <- 1:3
sapply(y, runif, min = 0, max = 2)




#### apply
## often use to apply a function to the rows or coloums of a matrix
## can be used on a array
## not really faster than a loop, but works in one single line

z <- matrix(rnorm(200),20,10)
apply(z, 1, mean)  # = rowSums
apply(z, 2, mean)  # = colMeans

t <- array(rnorm(2*2*10), c(2,2,10))
apply(t, c(1,2), mean)
rowMeans(t, dims = 2)




#### mapply

list(rep(1,4), rep(2,3), rep(3,2), rep(4,1))
mapply(rep, 1:4, 4:1)




#### tapply
## subset

s <- c(rnorm(10,1), runif(10), rnorm(10,3))
f <- gl(3,10)
f
tapply(s, f, mean)
tapply(s, f, mean, simplify = FALSE)




#### split
## not a loop function

s <- c(rnorm(10,1), runif(10), rnorm(10,3))
f <- gl(3,10)
split(s, f)
lapply(split(s, f), mean)




#### DEBUGGING TOOLS ####

## A test
printmessege <- function(x) {
    if(is.na(x))
        print('not support')
    else if(x > 0)
        print('x > 0')
    else
        print('x < 0')
    
    invisible(x)
}




## traceback: print out the function call stack after an error occurs, only the most recent one
## debug: flag a function for 'debug' mode, execute one line at a time
## browser: when the execution is called, run debug
## trace: insert debugging code into a function
## recover: mofify the error behavior so that can browse the function call stack

mean(nono)
# Error in mean(nono) : object 'nono' not found
traceback()
# 1: mean(nono)

lm(y - nono)
# Error in stats::model.frame(formula = y - nono, drop.unused.levels = TRUE) : 
# object 'y' not found
traceback()
# 4: stats::model.frame(formula = y - nono, drop.unused.levels = TRUE)
# 3: eval(mf, parent.frame())
# 2: eval(mf, parent.frame())
# 1: lm(y - nono)

debug(lm)  # firstly use debug()
lm(y - nono)  # then type codes




