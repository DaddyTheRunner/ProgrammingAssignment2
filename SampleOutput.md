## Sample Output

### Verifying the calculations work

Here we calculate the inverse of a simple 2x2 matrix

`
> superM <- makeCacheMatrix(matrix(1:4, 2, 2))
> superM$get()
     [,1] [,2]
[1,]    1    3
[2,]    2    4
> cacheSolve(superM, verbose=T)
Starting the calculation...
     [,1] [,2]
[1,]   -2  1.5
[2,]    1 -0.5
> cacheSolve(superM, verbose=T)
     [,1] [,2]
[1,]   -2  1.5
[2,]    1 -0.5
`

Next we verify that taking the invers of the inverse
returns us the original matrix.

`
> superMinv <- makeCacheMatrix(cacheSolve(superM))
> cacheSolve(superMinv, v=T)
Starting the calculation...
     [,1] [,2]
[1,]    1    3
[2,]    2    4
`



### Time Savings

Here is some sample output showing the time saved when calculating the 
inverse of a 1000 x 1000 random matrix

`
> superM <- makeCacheMatrix(matrix(rnorm(1000*1000,m=1)/20, 1000, 1000))
> det(superM$get())
[1] 3.598628e-18
> system.time(cacheSolve(superM, ver=T))
Starting the calculation...
   user  system elapsed 
   2.10    0.03    2.15 
> system.time(cacheSolve(superM, ver=T))
   user  system elapsed 
      0       0       0
`

