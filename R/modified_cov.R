#'modified_cov
#'
#'Gets the covariances between two vectors or columns of matrices with complete cases.
#'
#'@name modified_cov
#'
#'@param x a numeric vector, matrix or data frame with complete cases.
#'@param y NULL(default) or a numeric vector, matrix or data frame with complete cases and compatible dimensions to \code{x}.
#'
#'@return the covariances between x,y or columns of x matrix
#'
#'@details A matrix/data frame for \code{x} or both \code{x}, \code{y} vectors/matrices should be given to calculate covariances.
#'The inputs must be numeric or logical, without missing values. For \code{modified_cov()}, covariances will be calculated under method \code{pearson}, which produces same results for function \code{cov(x,y,use="all.obs", method="pearson")}
#'The denominator \code{n-1} is used when computing unbiased estimators of the covariances for i.i.d. observations(when only one observation for both \code{x}, \code{y} are given, the function will return \code{NaN}).
#'
#'@seealso \code{\link[=modified_cor]{modified_cor()}} for pearson correlation computation for complete vectors/matrices.
#'
#'@examples
#'## For complete matrices and vectors with compatible dimensions.
#'## x,y are both vectors with one element
#'modified_cov(1,1) # NaN
#'
#'## x,y are both vectors
#'modified_cov(c(1,3,5,FALSE),c(FALSE,TRUE,1,3)) # -1.083333
#'
#'## x,y are matrices/vectors
#'x1<-matrix(rnorm(1000,min=0,max=100),100,10)
#'y1<-c(rnorm(100,min=0,max=100))
#'stopifnot(all.equal(cov(x1,y1,use="all.obs",method="pearson"), modified_cov(x1,y1)))
#'
#'
#'@import Rcpp stats devtools bench corrplot ggplot2
#'
#'@export
#'
modified_cov=function (x, y = NULL){
  #Validation of inputs
  if (is.null(y)){
    if (any(is.na(x)))
      stop("missing observations in cov/cor")
  }
  else if (!is.null(y)){
    if (any(is.na(x))|any(is.na(y)))
      stop("missing observations in cov/cor")
  }
  tr<-function(m){
    if (is.data.frame(m)){
      m<-as.matrix(x)
    }
    else m
  }
  x<-tr(x)
  if ((!is.matrix(x))&is.null(y))
    stop("supply both 'x' and 'y' or a matrix-like 'x'")
  y<-tr(y)
  stopifnot(((is.numeric(x)||is.logical(x))&is.atomic(x)))
  if (!is.null(y)){
    stopifnot(((is.numeric(y)||is.logical(y))&is.atomic(y)))
  }

  #Import rcpp function "mat" to calculate product of matrices
  if (!is.null(y)){
    #Both x,y are matrices
    if (isTRUE(nrow(x)==nrow(y)&(is.null(nrow(x))==FALSE))){
      cov<-mat((t(x)-colMeans(x)),t(t(y)-colMeans(y)))/(nrow(x)-1)
      return(cov)
    }
    #Both x,y are vectors
    else if (isTRUE(length(x)==length(y)&(is.null(nrow(x))==TRUE))){
      cov<-as.numeric(t(x-mean(x))%*%(y-mean(y))/(length(x)-1))
      return(cov)
    }
    #One of x,y is matrix, the other is vector
    else if (isTRUE(nrow(x)==length(y)&(is.null(nrow(y))==TRUE))){
      cov<-(t(x)-colMeans(x))%*%(y-mean(y))/(nrow(x)-1)
      return(cov)
    }
    else if (isTRUE(length(x)==nrow(y)&(is.null(nrow(x))==TRUE))){
      cov<-t((t(y)-colMeans(y))%*%(x-mean(x))/(nrow(y)-1))
      return(cov)
    }
    else
      stop("incompatible dimensions")
  }
  #x is matrix, y is NULL
  else if(is.null(y)){
    cov<-mat((t(x)-colMeans(x)),t(t(x)-colMeans(x)))/(nrow(x)-1)
    return(cov)
  }
}










