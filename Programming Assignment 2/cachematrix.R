## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
    
    # initializae m for the inverse matrix
    m <- NULL
    
    # set matrix
    set <- function(matrix) {
        x <<- matrix
        m <<- NULL
    }
    
    # get matrix
    get <- function() {
        x
    }
    
    # set inverse of the matrix
    setinverse <- function(inverse) {
        m <<- inverse
    }
    
    # get the inverse of the matrix
    getinverse <- function() {
        m
    }
    
    # index
    list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
    
    # inverse x
    m <- x$getinverse()
    
    if(!is.null(m)) {
        messege("getting cached data")
        return(m)
    }
    
    # get the matrix from former calculation
    data <- x$get()
    
    # inverse matrix
    m <- solve(data) %*% data
    
    # set inverse to the object
    x$setinverse(m)
    
    # return
    m
}
