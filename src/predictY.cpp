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
  NumericMatrix X=NumericMatrix(x.nrow(), x.ncol() + 1);
  for (int i = 0; i < x.nrow(); i++) {
    X(i, 0) = 1.0; // Intercept column
  }
  for (int i = 0; i < x.nrow(); i++) {
    for (int j = 0; j < x.ncol(); j++) {
      X(i, j + 1) = x(i, j); // Shift columns by 1
    }
  }
  NumericVector y_hat=NumericVector(X.nrow(),0.0);
  for(int i=0; i<X.nrow();i++){
    for(int j=0; j<X.ncol();j++){
      y_hat[i]=y_hat[i]+X(i,j)*beta_hat[j];
    }
  }
  CharacterVector names_vec(y_hat.length());
  for(int i = 0; i<y_hat.length(); i++) {
    names_vec[i] = std::to_string(i + 1); // Names from 1 to n
  }
  y_hat.attr("names") = names_vec;
  return y_hat;
}

