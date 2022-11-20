#'modified_cov
#'
#'Gets the covariance between two vectors or columns of matrices with complete cases under the method option "pearson".
#'
#'@param x,y input value
#'
#'@return the covariances between x,y or columns of x matrix
#'
#'@examples
#'modified_cov(c(1,2,3,4),c(2,3,4,5))
#'
#'@export
#'
modified_cov=function (x, y = NULL, use = "all.obs", method = "pearson"){
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
  if (!is.null(y)){
    if (isTRUE(nrow(x)==nrow(y)&(is.null(nrow(x))==FALSE))){
      cov<-(t(x)-colMeans(x))%*%t(t(y)-colMeans(y))/(nrow(x)-1)
      return(cov)
    }
    else if (isTRUE(length(x)==length(y)&(is.null(nrow(x))==TRUE))){
      cov<-as.numeric(t(x-mean(x))%*%(y-mean(y))/(length(x)-1))
      return(cov)
    }
    else if (isTRUE(nrow(x)==length(y)&(is.null(nrow(y))==TRUE))){
      cov<-(t(x)-colMeans(x))%*%(y-mean(y))/(nrow(x)-1)
      return(cov)
    }
    else if (isTRUE(length(x)==nrow(y)&(is.null(nrow(x))==TRUE))){
      cov<-(t(y)-colMeans(y))%*%(x-mean(x))/(nrow(y)-1)
      return(cov)
    }
    else
      stop("incompatible dimensions")
  }
  else if(is.null(y)){
    cov<-(t(x)-colMeans(x))%*%t(t(x)-colMeans(x))/(nrow(x)-1)
    return(cov)
  }
}
