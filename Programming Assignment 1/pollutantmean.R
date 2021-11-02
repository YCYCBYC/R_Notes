## Programming Assignment 1: Air Pollution
## Part 1

pollutantmean <- function(directory, pollutant, id = 1:332) {
    
    # set filenames with path
    filenames <- paste0(directory, '/', formatC(id, width = 3, flag = '0'), '.csv')
    
    # read files and data
    polutotal <- 0
    polucount <- 0
    for(i in 1:length(id)) {
        temfile <- read.csv(file = filenames[i], sep = ',', header = TRUE)
        polutotal <- polutotal + sum(temfile[ , pollutant], na.rm = TRUE)
        polucount <- polucount + sum(!is.na(temfile[ , pollutant]))
    }
    
    # calculate
    polutotal/polucount
}

