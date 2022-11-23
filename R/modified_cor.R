#'modified_cor
#'
#'Gets the pearson correlation between two vectors or columns of matrices with complete cases.
#'
#'@name modified_cor
#'
#'@param x a numeric vector, matrix or data frame with complete cases.
#'@param y NULL(default) or a numeric vector, matrix or data frame with complete cases and compatible dimensions to \code{x}.
#'
#'@return the pearson correlation between x,y or columns of x matrix
#'
#'@details A matrix/data frame for \code{x} or both \code{x},\code{y} vectors/matrices should be given to calculate pearson correlation.
#'The inputs must be numeric or logical, without missing values. For \code{modified_cor()}, pearson correlation will be calculated, which produces same results for function \code{cor(x,y,use="all.obs", method="pearson")}
#'The denominator \code{n-1} is used when computing unbiased estimators of the covariances for i.i.d. observations(when only one observation for both \code{x}, \code{y} are given, the function will return \code{NaN}).
#'
#'@note Pearson method performs better on normal distributed samples.While Spearman and Kendall methods are usually applied on samples that are not in normal distribution.
#'
#'@seealso \code{\link[=modified_cov]{modified_cov()}} for covariance computation for complete vectors/matrices.
#'
#'@examples
#'## For complete matrices and vectors with compatible dimensions.
#'## x,y are both vectors with one element
#'modified_cor(1,2) # NaN
#'
#'## x,y are both vectors
#'modified_cor(c(1,2,3,TRUE,FALSE),c(FALSE,TRUE,4,7,0)) # 0.3019786
#'
#'## One of x,y is a matrix, and the other is a vector
#'x1<-matrix(rnorm(500,0,1),50,10)
#'y1<-c(rnorm(50,0,1))
#'stopifnot(all.equal(cor(x1,y1,use="all.obs",method="pearson"), modified_cor(x1,y1)))
#'
#'
#'@import Rcpp stats devtools bench corrplot ggplot2
#'
#'@export
#'
modified_cor=function (x, y=NULL){
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
  if (!((is.numeric(x)||is.logical(x))&is.atomic(x)))
    stop("'x' must be numeric")
  if (!is.null(y)){
    if(!((is.numeric(y)||is.logical(y))&is.atomic(y))){
      stop("'y' must be numeric")
    }
  }

  #Import rcpp function "mat" to calculate product of matrices
  if (!is.null(y)){
    #Both x,y are matrices
    if (isTRUE(nrow(x)==nrow(y)&(is.null(nrow(x))==FALSE))){
      cov<-mat((t(x)-colMeans(x)),t(t(y)-colMeans(y)))/(nrow(x)-1)
      cor<-matrix(0,nrow(cov),ncol(cov))
      for (i in 1:nrow(cov)){
        for (j in 1:ncol(cov)){
          cor[i,j]<-cov[i,j]/(sd(x[,i])*sd(y[,j]))
        }
      }
      return(cor)
    }
    #Both x,y are vectors
    else if (isTRUE(length(x)==length(y)&(is.null(nrow(x))==TRUE))){ #Both x,y are matrices
      cov<-as.numeric(t(x-mean(x))%*%(y-mean(y))/(length(x)-1))
      cor<-as.numeric(cov/(sd(x)*sd(y)))
      return(cor)
    }
    #One of x,y is matrix, the other is vector
    else if (isTRUE(nrow(x)==length(y)&(is.null(nrow(y))==TRUE))){
      cov<-(t(x)-colMeans(x))%*%(y-mean(y))/(nrow(x)-1)
      cor<-matrix(0,length(cov),1)
      for (i in 1:nrow(cov)){
        cor[i]<-cov[i]/(sd(x[,i])*sd(y))
      }
      return(cor)
    }
    else if (isTRUE(length(x)==nrow(y)&(is.null(nrow(x))==TRUE))){
      cov<-(t(y)-colMeans(y))%*%(x-mean(x))/(nrow(y)-1)
      cor<-matrix(0,length(cov),1)
      for (i in 1:nrow(cov)){
        cor[i]<-cov[i]/(sd(x)*sd(y[,i]))
      }
      return(t(cor))
    }
    else
      stop("incompatible dimensions")
  }
  #x is matrix, y is NULL
  else if(is.null(y)){
    cov<-mat((t(x)-colMeans(x)),t(t(x)-colMeans(x)))/(nrow(x)-1)
    cor<-matrix(0,nrow(cov),ncol(cov))
    for (i in 1:nrow(cov)){
      for (j in 1:ncol(cov)){
        cor[i,j]<-cov[i,j]/(sd(x[,i])*sd(x[,j]))
      }
    }
    return(cor)
  }
}
