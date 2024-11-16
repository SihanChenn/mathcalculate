#'linear_regress
#'
#'Compute linear regression models using least square method, and get a result which includes estimated coefficients, standard error of estimated coefficients, t statistics and p-value.
#'
#'@param y A numeric vector representing the dependent variable (without any NA values).
#'@param x A numeric matrix or data frame representing the covariates (without any NA values).
#'
#'@return Linear_regress returns a list of linear regression result using least squared method, containing the following components:
#'\item{Estimate}{Estimated coefficients for the model.}
#'\item{Std_Err}{Standard error for estimated coefficients.}
#'\item{t_statistic}{T statistics for estimated coefficients.}
#'\item{p_value}{P-value for t statistics of estimated coefficients.}
#'
#'@examples
#'require(MASS)
#'data(Boston)
#'y=Boston$medv
#'x=as.matrix(Boston[, -which(names(Boston) == "medv")])
#'linear_regress(y,x)
#'
#'x=c(4.17,5.58,5.18,6.11,4.50,4.61,5.17,4.53,5.33,5.14)
#'y= c(4.81,4.17,4.41,3.59,5.87,3.83,6.03,4.89,4.32,4.69)
#'linear_regress(y,x)
#'
#'@export
#'@importFrom stats model.matrix pt
#'
linear_regress=function(y,x){
  #design matrix
  X=model.matrix(y~x)
  Y=na.omit(y)
  n=nrow(X)
  p=ncol(X)
  #Estimation: beta_hat and var(beta_hat)
  betahat=solve(t(X)%*%X)%*%t(X)%*%Y
  Yhat=X%*%betahat
  epsilonhat = Y - Yhat
  #estimated sigma^2
  sigma_squared = t(epsilonhat)%*%epsilonhat/(n-p)
  #variance of beta_hat
  var_betahat = diag( solve(t(X)%*%X) )*c(sigma_squared)
  se_betahat = sqrt(var_betahat)
  #t statistic and p value
  t_statistic = c(betahat/se_betahat)
  p_value = c(2*( 1-pt(q=abs(t_statistic),df=n-p) ))
  by_hand = cbind(Estimate=c(betahat), Std_Err=se_betahat,t_statistic=t_statistic,p_value=p_value)
  by_hand_list <- lapply(as.data.frame(by_hand), function(col) {setNames(col, rownames(by_hand))})
  return(by_hand_list)
}
