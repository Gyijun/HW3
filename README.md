
<!-- README.md is generated from README.Rmd. Please edit that file -->

## mypackage

<!-- badges: start -->

[![R-CMD-check](https://github.com/Gyijun/mypackage/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/Gyijun/mypackage/actions/workflows/R-CMD-check.yaml)
[![Codecov test
coverage](https://codecov.io/gh/Gyijun/mypackage/branch/master/graph/badge.svg)](https://app.codecov.io/gh/Gyijun/mypackage?branch=master)
<!-- badges: end -->

## Overview

The goal of mypackage is to calculate covariances and pearson
correlation between two vectors or columns of matrices.

-   `modified_cov()` conducts covariances computing between vectors and
    columns of matrices with complete cases

-   `modified_cor()` conducts pearson correlation computing between
    vectors and columns of matrices with complete cases

## Installation

You can install the development version of mypackage from
[GitHub](https://github.com/) with:

``` r
#install.packages("devtools")
#library(devtools)
devtools::install_github("Gyijun/mypackage", build_vignettes = T)
#> Skipping install of 'mypackage' from a github remote, the SHA1 (242d82ff) has not changed since last install.
#>   Use `force = TRUE` to force installation
```

## Usage

You can apply functions of mypackage by below operations:

``` r
library(mypackage)
```

## Basic examples

Here are some basic examples to apply `modified_cov()` and
`modified_cor()`:

``` r
# covariance computing
(cov<-modified_cov(matrix(c(rnorm(100,0,1),c(rnorm(100,0,1)),2,100))))
#> Registered S3 methods overwritten by 'RcppEigen':
#>   method               from         
#>   predict.fastLm       RcppArmadillo
#>   print.fastLm         RcppArmadillo
#>   summary.fastLm       RcppArmadillo
#>   print.summary.fastLm RcppArmadillo
#>          [,1]
#> [1,] 50.52825

#pearson correlation computing
(cor<-modified_cor(c(rnorm(100,0,1)),c(rnorm(100,0,1))))
#> [1] 0.1243689
```
