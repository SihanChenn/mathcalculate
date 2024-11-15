#include <Rcpp.h>
using namespace Rcpp;

//
//'PredictY
//'
//'Gets predict y for a linear regression
//'
//'@param x,beta_hat input value
//'
//'@return y_hat
//'
//'@examples
//'mat <- matrix(c(1, 2, 3, 4, 5, 6,7,8,9), nrow = 3);
//'beta = c(1.1, 2.2, 3.3);
//'y_hat=PredictY(mat,beta);
//'
//'@export
//'
// [[Rcpp::export]]
NumericVector PredictY(NumericMatrix x,NumericVector beta_hat) {
  NumericVector y_hat=NumericVector(x.nrow(),0.0);
  for(int i=0; i<x.nrow();i++){
    for(int j=0; j<x.ncol();j++){
      y_hat[i]=y_hat[i]+x(i,j)*beta_hat[j];
    }
  }
  return y_hat;
}

