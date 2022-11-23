#Two vectors are provided
test_that("pearson correlation works", {
  x<-c(rnorm(500,0,1))
  y<-c(rnorm(500,0,1))
  C0<-cor(x,y)
  expect_equal(modified_cor(x,y), C0)
})

#x is matrix, y is vector
test_that("covariance works", {
  x<-matrix(rnorm(5000,0,1),500,10)
  y<-c(rnorm(500,0,1))
  C1<-cor(x,y)
  expect_equal(modified_cor(x,y), C1)
})

#x is vector, y is matrix
test_that("pearson correlation works", {
  x<-c(rnorm(500,0,100))
  y<-matrix(rnorm(5000,0,100),500,10)
  C2<-cor(x,y)
  expect_equal(modified_cor(x,y), C2)
})

#Two matrices provided
test_that("pearson correlation works", {
  x<-matrix(rnorm(5000,0,1),500,10)
  y<-matrix(rnorm(5000,0,1),500,10)
  C3<-cor(x,y)
  expect_equal(modified_cor(x,y), C3)
})

#Only x provided(matrix form)
test_that("pearson correlation works", {
  x<-matrix(rnorm(5000,0,1),500,10)
  C4<-cor(x)
  expect_equal(modified_cor(x), C4)
})

# Data frame
test_that("pearson correlation works", {
  x<-as.data.frame(matrix(rnorm(5000,0,1),500,10),header=FALSE)
  C5<-array(cor(x),dim=length(cor(x)),dimnames=NULL)
  Cm<-array(modified_cor(x),dim=length(modified_cor(x)),dimnames=NULL)
  expect_equal(Cm, C5)
})

# Error conditions
## One vector
test_that("pearson correlation works", {
  x<-c(rnorm(5000,0,1))
  expect_error(modified_cor(x),"supply both 'x' and 'y' or a matrix-like 'x'")
})

## Missing value
test_that("pearson correlation works", {
  x<-matrix(rnorm(5000,0,10),100,50)
  x[10,6]=NA
  expect_error(modified_cor(x),"missing observations in cov/cor")
})

## Missing value2
test_that("pearson correlation works", {
  x<-matrix(rnorm(5000,0,10),100,50)
  x[10,6]=NA
  y<-matrix(rnorm(5000,0,10),100,50)
  expect_error(modified_cor(x,y),"missing observations in cov/cor")
})


## Incompatible dimensions
test_that("pearson correlation works", {
  x<-matrix(rnorm(50,0,1),5,10)
  y<-matrix(rnorm(50,0,1),10,5)
  expect_error(modified_cor(x,y),"incompatible dimensions")
})

## Not numeric
test_that("pearson correlation works", {
  expect_error(modified_cor(c(1,"def",TRUE,"abc"),c(1,2,3,4)),"'x' must be numeric")
})



