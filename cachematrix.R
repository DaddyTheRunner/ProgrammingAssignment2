## A system of functions for caching a matrix and
## its inverse.
##
## DESCRIPTION:
## The functions in this file provide a simple interface
## for storing, accessing, and calculating the inverse
## of a matrix.
##
## LIMITATIONS:
## The current version does no error checking.
## Specifically, it does not check to see if the
## matrix can be inverted before attempting the
## calculation.
## Function: makeCacheMatrix(x = matrix())
##
## Author: DaddyTheRunner
## Date: 2014-11-14
##
## DESCRIPTION:
## makeCacheMatrix returns a list containing four functions
## that provide the interface for storing and accessing a
## matrix and its inverse.
##
## PARAMETERS
## x - a matrix
##
## USAGE:
##
## Create an instance
## m <- matrix(1:4, nrow = 2, ncol = 2)
## superMatrix <- makeCacheMatrix(m)
##
## Store a matrix
## m <- matrix(1:4, nrow = 2, ncol = 2)
## superMatrix$set(m)
##
## Retrieve a matrix
## m <- superMatrix$get()
##
## Cache the inverse
## minv <- solve(m)
## superMatrix$setInverse(minv)
##
## Retrieve the cached inverse
## minv <- superMatrix$getInverse()

makeCacheMatrix <- function(x = matrix()) {
	## Create a cachedMatrix *object*

	## Create an empty cache
	cachedInv <- NULL

	## Create the interface functions
	## store the matrix and clear the cache
	set <- function(m) {
		x <<- m
		cachedInv <<- NULL
	}

	## get the stored matrix
	get <- function() {
		x
	}

	## cache the inverse
	setInverse <- function(minv) {
		cachedInv <<- minv
	}

	## get the cached inverse
	getInverse <- function() {
		cachedInv
	}

	## create a list of the functions and return it
	list(set = set,
	     get = get,
           setInverse = setInverse,
	     getInverse = getInverse)
	
}


## Function: cacheSolve(x, ...)
##
## Author: DaddyTheRunner
## Date: 2014-11-14
##
## DESCRIPTION:
## Calculates or retrieves the inverse of a matrix depending
## upon the current state of the cache.
##
## PARAMETERS:
## x - a cachable matrix created using makeCacheMatrix()
## verbose - logical - used to control printing of caching messages
## ... - additional parameters to pass to the solve() function
##
## USAGE:
## m <- matrix(1:4, nrow = 2, ncol = 2)
## superMatrix <- makeCacheMatrix(m)
## minv <- cacheSovle(superMatrix)

cacheSolve <- function(x, verbose = FALSE, ...) {
	## Return a matrix that is the inverse of 'x'

	## Check to see if we have to calculate the inverse
	if (is.null(x$getInverse())) {
		## Calculate the inverse and cache it
		if( verbose ) message("Starting the calculation...")
		x$setInverse(solve(x$get(), ...))
	}

	## Return the inverse
	x$getInverse()

}