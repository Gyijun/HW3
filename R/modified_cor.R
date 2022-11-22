#'modified_cor
#'
#'Gets the pearson correlation between two vectors or columns of matrices with complete cases.
#'
#'@param x a numeric vector, matrix or data frame with complete cases.
#'@param y NULL(default) or a numeric vector, matrix or data frame with complete cases and compatible dimensions to x.
#'
#'@return the pearson correlation between x,y or columns of x matrix
#'
#'@details A matrix/data frame for x or both x,y vectors/matrices should be given to calculate pearson correlation.
#'The inputs must be numeric or logical, without missing values. For modified_cor, pearson correlation will be calculated, which produces same results for function cor(x,y,use="all.obs", method="pearson")
#'The denominator n - 1 is used when computing unbiased estimators of the covariances for i.i.d. observations(when only one observation for x,y are given, the function will return NaN).
#'
#'@seealso modified_cov for covariance computation for complete vectors/matrices.
#'
#'@examples
#'## For complete matrices and vectors with compatible dimensions.
#'## x,y are both vectors with one element
#'modified_cor(1,2) # NaN
#'
#'## x,y are both vectors
#'modified_cor(c(1,2,3,TRUE,FALSE),c(FALSE,TRUE,4,7,0)) # 0.3019786
#
#'## y is NULL, x is matrix
#'x<-matrix(runif(1000,min=0,max=100),10,100)
#'stopifnot(all.equal(cor(x,y=NULL,use="all.obs",method="pearson"), modified_cor(x)))
#'
#'## Both x,y are matrices
#'x1<-matrix(runif(100,min=0,max=100),10,10)
#'y1<-c(runif(10,min=0,max=100))
#'stopifnot(all.equal(cor(x1,y1,use="all.obs",method="pearson"), modified_cor(x1,y1)))
#'
#'
#'## For complete matrices and vectors with incompatible dimensions
#'modified_cor(matrix(c(1,2,3,4,3,4,5,6),2,4),c(1,2,3,4)) # Error: incompatible dimensions
#'
#'
#'@import Rcpp
#'
#'@export
#'
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
  sourceCpp("src/code.cpp")

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
      cor<-matrix(0,length(y),1)
      for (i in 1:nrow(cov)){
        cor[i]<-cov[i]/(sd(x[,i])*sd(y))
      }
      return(cor)
    }
    else if (isTRUE(length(x)==nrow(y)&(is.null(nrow(x))==TRUE))){
      cov<-(t(y)-colMeans(y))%*%(x-mean(x))/(nrow(y)-1)
      cor<-matrix(0,length(x),1)
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
