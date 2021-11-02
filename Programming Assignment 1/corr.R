## Programming Assignment 1: Air Pollution
## Part 3

corr <- function(directory, threshold = 0) {
    
    # set filenames with path
    filenames <- paste0(directory, '/', formatC(1:332, width = 3, flag = '0'), '.csv')
    
    # count
    temcorr <- c(NULL)
    for (i in 1:332) {
        temfile <- read.csv(file = filenames[i], sep = ',', header = TRUE)
        
        if(sum(complete.cases(temfile)) >= threshold){
            temfile <- temfile[complete.cases(temfile), ]
            temcorr <- c(temcorr, cor(x = temfile$sulfate, y = temfile$nitrate))
        }

    }
    
    # output
    temcorr
}