#### best
best <- function(state, outcome) {
    
    ## read file
    data1 <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    
    ## change name of the variable
    state1 <- state
    
    ## state and outcome valid?
    if(!state1 %in% unique(data1[["State"]])) {
        stop('invalid state')
    }
    if(!outcome %in% c("heart attack", "heart failure", "pneumonia")) {
        stop('invalid outcome')
    }
    
    
    ## filter states
    data2 <- data1[data1$State == state1, ]
    
    ## filter outcome
    if(outcome == 'heart attack') {
        data3 <- data2[, c(2,11)]
    } else if(outcome == 'heart failure') {
        data3 <- data2[, c(2,17)]
    } else if(outcome == 'pneumonia') {
        data3 <- data2[, c(2,23)]
    }
    
    ## data clean
    data3[, 2] <- as.numeric(data3[, 2])
    data3 <- data3[complete.cases(data3), ]
    
    ## locate mins
    minloc <- which(data3[, 2] == min(data3[, 2]))
    mintitle <- data3[minloc, 1]
    print(sort(mintitle)[1])
}







