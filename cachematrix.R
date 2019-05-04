## Put comments here that give an overall description of what your
## functions do

## This function take in a matrix and creastes a list containing functions to set and retreive the matrix as well as its inverse 

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


## This function takes in the list created in the previous function and checks to see in its inverse is already cahed, if so, it prints the cached inverse. If not it calculted and prints the inverse. 

cacheSolve <- function(x, ...) {
  m <- x$getinverse()
  if(!is.null(m)) {
    message("Getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinverse(m)
  m
}