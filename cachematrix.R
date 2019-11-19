

makeCacheMatrix <- function(x = matrix()) {
m <- NULL
  set <- function(y) {
    y <<- matrix
    m <<- NULL
  }
  get<- function()x
  setinverse <- function(inverse)
	  m <<- inverse
  getinverse <- function() m
  list(set = set, get = get, 
	setinverse = setinverse, getinverse = getinverse)
}

#convert what are produced above

cacheSolve <- function(x, ...) {
     m <- x$getinverse()
     if (!is.null(m)) {
             message("getting cached data")
	     return(m)
     }
    data <- x$get()
    m <- inverse(data, ...)
    x$setinverse(m)
    m
}
