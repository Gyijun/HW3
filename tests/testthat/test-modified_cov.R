#Two vectors are provided
test_that("covariance works", {
  x<-c(rnorm(500,0,1))
  y<-c(rnorm(500,0,1))
  C0<-cov(x,y)
  expect_equal(modified_cov(x,y), C0)
})


