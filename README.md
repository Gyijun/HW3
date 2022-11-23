
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

The calculation is conducted based on the following fomulas:

$$
\begin{aligned}
&cov(X,Y)=E[(X- μ_{x})(Y-μ_{y})]\\
&r_{xy}=\frac{\sum\limits_{i=1}^n(x_{i}-\bar{x})(y_{i}-\bar{y})}{(n-1)s_{x}s_{y}}\\
\end{aligned}
$$

## Installation

You can install the development version of `mypackage` from
[GitHub](https://github.com/) with:

``` r
#install.packages("devtools")
#library(devtools)
devtools::install_github("Gyijun/mypackage", build_vignettes = T)
#> Downloading GitHub repo Gyijun/mypackage@HEAD
#> colorspace   (2.0-2 -> 2.0-3) [CRAN]
#> viridisLite  (0.4.0 -> 0.4.1) [CRAN]
#> RColorBrewer (1.1-2 -> 1.1-3) [CRAN]
#> farver       (2.1.0 -> 2.1.1) [CRAN]
#> cpp11        (NA    -> 0.4.3) [CRAN]
#> brew         (NA    -> 1.0-8) [CRAN]
#> openssl      (1.4.6 -> 2.0.4) [CRAN]
#> httpuv       (NA    -> 1.6.6) [CRAN]
#> gert         (1.5.0 -> 1.9.1) [CRAN]
#> isoband      (0.2.5 -> 0.2.6) [CRAN]
#> gtable       (0.3.0 -> 0.3.1) [CRAN]
#> Installing 11 packages: colorspace, viridisLite, RColorBrewer, farver, cpp11, brew, openssl, httpuv, gert, isoband, gtable
#> Installing packages into '/home/guoyijun/R/x86_64-pc-linux-gnu-library/4.1'
#> (as 'lib' is unspecified)
#> Warning in i.p(...): installation of package 'cpp11' had non-zero exit status
#> Warning in i.p(...): installation of package 'brew' had non-zero exit status
#> Warning in i.p(...): installation of package 'openssl' had non-zero exit status
#> Warning in i.p(...): installation of package 'httpuv' had non-zero exit status
#> Warning in i.p(...): installation of package 'gert' had non-zero exit status
#> * checking for file ‘/tmp/Rtmpw90ARo/remotes3a5131eac919/Gyijun-mypackage-c0afc3a/DESCRIPTION’ ... OK
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
#> [1,] 50.74434

#pearson correlation computing
(cor<-modified_cor(c(rnorm(100,0,1)),c(rnorm(100,0,1))))
#> [1] 0.06556159
```
