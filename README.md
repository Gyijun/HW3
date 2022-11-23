
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

You can install the development version of `mypackage` from
[GitHub](https://github.com/) with:

``` r
#install.packages("devtools")
#library(devtools)
devtools::install_github("Gyijun/mypackage", build_vignettes = T)
#> Downloading GitHub repo Gyijun/mypackage@HEAD
#> pillar      (1.7.0 -> 1.8.1) [CRAN]
#> cpp11       (NA    -> 0.4.3) [CRAN]
#> knitr       (1.39  -> 1.41 ) [CRAN]
#> brew        (NA    -> 1.0-8) [CRAN]
#> openssl     (1.4.6 -> 2.0.4) [CRAN]
#> sass        (0.4.0 -> 0.4.3) [CRAN]
#> rmarkdown   (2.14  -> 2.18 ) [CRAN]
#> httr        (1.4.2 -> 1.4.4) [CRAN]
#> bslib       (0.3.1 -> 0.4.1) [CRAN]
#> fontawesome (0.2.2 -> 0.4.0) [CRAN]
#> httpuv      (NA    -> 1.6.6) [CRAN]
#> shiny       (1.7.1 -> 1.7.3) [CRAN]
#> gitcreds    (0.1.1 -> 0.1.2) [CRAN]
#> zip         (2.2.0 -> 2.2.2) [CRAN]
#> rstudioapi  (0.13  -> 0.14 ) [CRAN]
#> gh          (1.3.0 -> 1.3.1) [CRAN]
#> gert        (1.5.0 -> 1.9.1) [CRAN]
#> clipr       (0.7.1 -> 0.8.0) [CRAN]
#> rversions   (2.1.1 -> 2.1.2) [CRAN]
#> Installing 19 packages: pillar, cpp11, knitr, brew, openssl, sass, rmarkdown, httr, bslib, fontawesome, httpuv, shiny, gitcreds, zip, rstudioapi, gh, gert, clipr, rversions
#> Installing packages into '/home/guoyijun/R/x86_64-pc-linux-gnu-library/4.1'
#> (as 'lib' is unspecified)
#> Warning in i.p(...): installation of package 'cpp11' had non-zero exit status
#> Warning in i.p(...): installation of package 'brew' had non-zero exit status
#> Warning in i.p(...): installation of package 'openssl' had non-zero exit status
#> Warning in i.p(...): installation of package 'httpuv' had non-zero exit status
#> Warning in i.p(...): installation of package 'gert' had non-zero exit status
#> * checking for file ‘/tmp/Rtmp2zx4Q1/remotes22ca15d4f87d/Gyijun-mypackage-2244f8e/DESCRIPTION’ ... OK
#> * preparing ‘mypackage’:
#> * checking DESCRIPTION meta-information ... OK
#> * cleaning src
#> * installing the package to build vignettes
#> * creating vignettes ... OK
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
#> Warning in i.p(...): installation of package '/tmp/Rtmp2zx4Q1/file22ca44b13933/
#> mypackage_0.1.0.tar.gz' had non-zero exit status
```

To install `mypackage`, you might also need to install `devtools`
package. See detailed instruction in the
[tutorial](https://github.com/Gyijun/mypackage/blob/master/vignettes/mypackage.Rmd)
.

## Usage

You can load `mypackage` by the following codes:

``` r
library(mypackage)
```

## Basic examples

Here are some basic examples to apply `modified_cov()` and
`modified_cor()`:

``` r
# covariance computing
(cov<-modified_cov(matrix(c(rnorm(100,0,1),c(rnorm(100,0,1)),2,100))))
#>          [,1]
#> [1,] 50.52048

#pearson correlation computing
(cor<-modified_cor(c(rnorm(100,0,1)),c(rnorm(100,0,1))))
#> [1] 0.204499
```
