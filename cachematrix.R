# Two functions makeCacheMatrix and cacheSolve has been written 
# to complete the program objectives
# Refer TestResults.txt to view the Test Steps and results of the program


# makeCacheMatrix
# The function stores a matrix and cache its inverse
# Has functions to Set matrix, Getting the matrix, Cache and Retrive Inverse

makeCacheMatrix <- function(x = numeric()) {

  #Initializing Cache to null
  
  cache <- NULL

  # Set the Matrix
  
  setMatrix <- function(newValue) {
    x <<- newValue
    cache <<- NULL
  }
  
  # Return the matrix using getMatrix
  
  getMatrix <- function() {
    x
  }

  # Cache it
  
  cacheInverse <- function(solve) {
    cache <<- solve
  }
  
  # Getting cached value
  
  getInverse <- function() {
    cache
  }
  
  # Function returns a list of functions
  
  list(setMatrix = setMatrix, getMatrix = getMatrix, cacheInverse = cacheInverse, getInverse = getInverse)
}

# This function returns the inverse of the special matrix
# Cache the inverse the first time
# Uses cache data thereafter


cacheSolve <- function(y, ...) {
  
  # Function to pick cached value
  
  inverse <- y$getInverse()
  
  # Condition validates for existence of cache
  
  if(!is.null(inverse)) {
    message("I am getting inverse from cached data")
    return(inverse)
  }
  message("Cache not present and I am building it")
  data <- y$getMatrix()
  inverse <- solve(data)
  y$cacheInverse(inverse)
  inverse
}
