
// [[Rcpp::depends(RcppArmadillo)]]

#include <RcppArmadillo.h>

// [[Rcpp::export]]
SEXP mat(arma::mat A, arma::mat B){
  arma::mat C = A * B;

  return Rcpp::wrap(C);
}
