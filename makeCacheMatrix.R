#The following pair of functions cache the inverse of a matrix.

#The first function, makeVector creates a special "vector", which is really a list containing #a function to a) set the value of the matrix; b) get the value of the matrix; c) set the value #of the inverse (with the function solve); d) get the value of the inverse.

makeCacheMatrix <- function(x = matrix()) {
        inv <- NULL
        set <- function(y) {
                x <<- y
                inv <<- NULL
        }
        get <- function() x
        setsolve <- function(solve) inv <<- solve
        getsolve <- function() inv
        list(set = set, get = get,
             setsolve = setsolve,
             getsolve = getsolve)
}

#The following function calculates the mean of the special "matrix" created with the above #function. However, it first checks to see if the inverse has already been calculated. If so, #it gets the inverse from the cache and skips the computation. Otherwise, it calculates the #inverse of the data and sets the value of the inverse in the cache via the setsolve #function.

cachesolve <- function(x, ...) {
        inv <- x$getsolve()
        if(!is.null(inv)) {
                message("getting cached data")
                return(inv)
        }
        data <- x$get()(
        inv <- solve(data, ...)
        x$setsolve(inv)
        inv
}


A<-function(x=commutation.matrix()){
y<-solve(x)}
