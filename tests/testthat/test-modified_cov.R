#Two vectors are provided
test_that("covariance works", {
  x<-c(rnorm(500,0,1))
  y<-c(rnorm(500,0,1))
  C0<-cov(x,y)
  expect_equal(modified_cov(x,y), C0)
})

#x is matrix, y is vector
test_that("covariance works", {
  x<-matrix(rnorm(5000,0,1),500,10)
  y<-c(rnorm(500,0,1))
  C1<-cov(x,y)
  expect_equal(modified_cov(x,y), C1)
})

#x is vector, y is matrix
test_that("covariance works", {
  x<-c(rnorm(500,0,100))
  y<-matrix(rnorm(5000,0,100),500,10)
  C2<-cov(x,y)
  expect_equal(modified_cov(x,y), C2)
})

#Two matrices provided
test_that("covariance works", {
  x<-matrix(rnorm(5000,0,1),500,10)
  y<-matrix(rnorm(5000,0,1),500,10)
  C3<-cov(x,y)
  expect_equal(modified_cov(x,y), C3)
})

#Only x provided(matrix form)
test_that("covariance works", {
  x<-matrix(rnorm(5000,0,1),500,10)
  C4<-cov(x)
  expect_equal(modified_cov(x), C4)
})

# Data frame
test_that("covariance works", {
  x<-as.data.frame(matrix(rnorm(5000,0,1),500,10),header=FALSE)
  C5<-array(cov(x),dim=length(cov(x)),dimnames=NULL)
  Cm<-array(modified_cov(x),dim=length(modified_cov(x)),dimnames=NULL)
  expect_equal(Cm, C5)
})

# Error conditions
## One vector
test_that("pearson correlation works", {
  x<-c(rnorm(5000,0,1))
  expect_error(modified_cov(x),"supply both 'x' and 'y' or a matrix-like 'x'")
})

## Missing value
test_that("pearson correlation works", {
  x<-matrix(rnorm(5000,0,10),100,50)
  x[10,6]=NA
  expect_error(modified_cov(x),"missing observations in cov/cor")
})

## Missing value2
test_that("pearson correlation works", {
  x<-matrix(rnorm(5000,0,10),100,50)
  x[10,6]=NA
  y<-matrix(rnorm(5000,0,10),100,50)
  expect_error(modified_cov(x,y),"missing observations in cov/cor")
})


## Incompatible dimensions
test_that("pearson correlation works", {
  x<-matrix(rnorm(50,0,1),5,10)
  y<-matrix(rnorm(50,0,1),10,5)
  expect_error(modified_cov(x,y),"incompatible dimensions")
})

## Not numeric
test_that("pearson correlation works", {
  expect_error(modified_cov(c(1,"def",TRUE,"abc")))
})

