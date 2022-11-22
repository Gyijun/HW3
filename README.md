
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Overview

<!-- badges: start -->

[![R-CMD-check](https://github.com/Gyijun/mypackage/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/Gyijun/mypackage/actions/workflows/R-CMD-check.yaml)
[![Codecov test
coverage](https://codecov.io/gh/Gyijun/mypackage/branch/master/graph/badge.svg)](https://app.codecov.io/gh/Gyijun/mypackage?branch=master)
<!-- badges: end -->

The goal of mypackage is to calculate covariances and pearson
correlation between two vectors or columns of matrices. -
`modified_cov()` conducts covariances computing between vectors and
columns of matrices with complete cases - `modified_cor()` conducts
pearson correlation computing between vectors and columns of matrices
with complete cases

## Installation

You can install the development version of mypackage from
[GitHub](https://github.com/) with:

``` r
library(devtools)
#> Loading required package: usethis
devtools::install_github("Gyijun/mypackage")
#> Downloading GitHub repo Gyijun/mypackage@HEAD
#> 
#> * checking for file ‘/tmp/RtmpLIMBZ5/remotes242247a408deb/Gyijun-mypackage-905d5e9/DESCRIPTION’ ... OK
#> * preparing ‘mypackage’:
#> * checking DESCRIPTION meta-information ... OK
#> * cleaning src
#> * checking for LF line-endings in source and make files and shell scripts
#> * checking for empty or unneeded directories
#> Omitted ‘LazyData’ from DESCRIPTION
#> * building ‘mypackage_0.1.0.tar.gz’
#> Warning in sprintf(gettext(fmt, domain = domain), ...) :
#>   one argument not used by format 'invalid uid value replaced by that for user 'nobody''
#> Warning: invalid uid value replaced by that for user 'nobody'
#> Warning in sprintf(gettext(fmt, domain = domain), ...) :
#>   one argument not used by format 'invalid gid value replaced by that for user 'nobody''
#> Warning: invalid gid value replaced by that for user 'nobody'
#> Installing package into '/home/guoyijun/R/x86_64-pc-linux-gnu-library/4.1'
#> (as 'lib' is unspecified)
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
#> [1,] 50.46494

#pearson correlation computing
(cor<-modified_cor(c(rnorm(100,0,1)),c(rnorm(100,0,1))))
#> [1] -0.03641616
```
