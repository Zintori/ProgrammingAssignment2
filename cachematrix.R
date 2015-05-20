## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

## This is a caching function that set/get the value of the matrix and
## set/get the value of the matrix inverse

makeCacheMatrix <- function(x = matrix()) {
  inverse <- NULL
  set <- function(y){
    x <<- y
    inverse <<- NULL
  }
  get <- function() x
  setinverse<-function(solve) {
    m<<- solve
  }
  getinverse<-function() inverse
  list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}


## Write a short comment describing this function
## This function attempts to find a cached value for the inverse
## It computes the inverse if the cached value is not found, caches the
## computed value and returns it

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  inverse <- x$getinverse()
  if(!is.null(inverse)) {
    return(inverse)
  }
  value <- x$get()
  inverse <- solve(value)
  x$setinverse(inverse)
  inverse
}
