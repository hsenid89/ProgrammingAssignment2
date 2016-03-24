
## Creates a special matrix object that can cache the inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
# Initiating the inverse
u <- NULL

# The following fuction will set the matrix
set <- function( matrix ) {
            x <<- matrix
            u <<- NULL
    }


## The following function will get the matrix
     get <- function() {
     	## Return the matrix
     	x
     }

## Method to set the inverse of the matrix
     setInverse <- function(inverse) {
         u <<- inverse
    }
    
    ## Method to get the inverse of the matrix
     getInverse <- function() {
         ## Return the inverse property
         u
     }
 
     ## Return a list of the methods
     list(set = set, get = get,
          setInverse = setInverse,
          getInverse = getInverse)
          
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Returning a matrix that is the inverse of 'x'
         u <- x$getInverse()
 
     ## Return the inverse if its already set
     if( !is.null(u) ) {
             message("getting cached data")
             return(u)
     }
 
     ## Obtain the matrix from the object
     data <- x$get()
 
     ## Calculating the inverse using matrix multiplication %*%
     u <- solve(data)
 
     ## Set the inverse to the object
     x$setInverse(u)
 
     ## Return the matrix
     u
}
