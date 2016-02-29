## This is the function for caching the inverse matrix
## To reduce the time complexity we simply cache the inverse matrix by creating a special object to store a matrix and cache its inverse


makeCacheMatrix <- function(x = matrix()) {
	inve <- NULL
	set <- function(y){
		x<<-y
		inve<<-NULL
	}
	get<-function() x
	setInverse<-function(inverse) inve<<-inverse
	getInverse<-function() inve
	list(set=set,get=get,setInverse=setInverse,getInverse=getInverse)
}

## This function is to calculate the inverse of matrix created by the above matrix. If the matrix is same and inverse has already computed then the cached inverse matrix is retrieved.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
	inve <- x$getInverse()
	if(!is.null(inve)){
		message("getting cache data")
		return(inve)
	}
	my_matrix <- x$get()
	inve<-solve(my_matrix,...)
	x$setInverse(inve)
	inve
}

