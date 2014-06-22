## Analog to example

## Create a cashed matrix with getter and setter methods

makeCacheMatrix <- function(x = matrix()) {
  m <<- NULL
  set <- function(y) {
        x <<- y
        m <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) m <<- inverse
  getinverse <- function() m
  list(set = set, get = get,
          setinverse = setinverse,
          getinverse = getinverse)
}


## function that returns the inverse of a cashed matrix
## - either the cashed value
## - or a calculated inverse and setting the cashed value for the next time

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    m <- x$getinverse()
    if (!is.null(m)){
      message("getting cashed data")
      return(m)
    }
    data <- x$get()
    m <- solve(data)
    x$setinverse(m)
    m
    
}
