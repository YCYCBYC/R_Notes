## Programming Assignment 1: Air Pollution
## Part 2

complete <- function(directory, id = 1:332) {
    
    # set filenames with path
    filenames <- paste0(directory, '/', formatC(id, width = 3, flag = '0'), '.csv')
  
    # set matrix
    temmatrix = matrix(0, nrow = length(id), ncol = 2)
  
    # count
    for (i in 1:length(id)) {
        temfile <- read.csv(file = filenames[i], sep = ',', header = TRUE)
        temmatrix[i,1] <- id[i]
        temmatrix[i,2] <- sum(complete.cases(temfile))
    }
    
    # output
    temframe <- data.frame(temmatrix)
    colnames(temframe) <- c('id','nobs')
    temframe
  
}