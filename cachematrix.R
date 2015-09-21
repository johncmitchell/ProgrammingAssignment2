## This R script creates two functions that cache the inverse of a matrix.

## This function solves the matrix and stores the result in a cache

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
            x <<- y
            m <<- NULL
        }
        get <- function() x
        setinverse <- function(solve) m <<- solve
        getinverse <- function() m
        list(set = set, get = get,
        setinverse = setinverse,
        getinverse = getinverse)

}


## This function checks to see if the inverse of the matrix is stored in the cache
## if the inverse is not stored, it will be calculated.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        m <- x$getinverse()
        if(!is.null(m)) {
            message("getting cached data")
            return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setinverse(m)
        m
        
        
}
