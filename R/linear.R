#'linear_regress
#'
#'compute linear regression models using least square method, and get a result which includes estimated coefficients,standard error of estimated coefficients, t statistics and p-value..
#'
#'@param x,y input value
#'
#'@return regression result
#'
#'@examples
#'library(MASS)  # make sure MASS is loaded
#'data(Boston)
#'y=Boston$medv
#'x <- as.matrix(Boston[, -which(names(Boston) == "medv")])
#'linear_regress(y,x)
#'
#'@export
#'@importFrom stats model.matrix pt
#'
linear_regress=function(y,x){
  #### define design matrix, outcome, dimensions ####
  X <- model.matrix(y~x)
  Y = y
  n = nrow(X)
  p = ncol(X)

  #### Estimation: betahat and var(betahat) ####
  betahat = solve(t(X)%*%X)%*%t(X)%*%Y
  Yhat = X%*%betahat
  epsilonhat = Y - Yhat ## residual
  ## estimated sigma^2
  sigma_squared = t(epsilonhat)%*%epsilonhat/(n-p)
  ## variance of betahat
  var_betahat = diag( solve(t(X)%*%X) )*c(sigma_squared)
  se_betahat = sqrt(var_betahat) ## se of betahat
  #### Inference: t statistic and p val for H0: beta=0 ####
  t_statistic = c(betahat/se_betahat)
  p_value = c(2*( 1-pt(q=abs(t_statistic),df=n-p) ))
  by_hand = cbind(Estimate=c(betahat), Std_Err=se_betahat,
                   t_statistic=t_statistic,
                   p_value=p_value)
  # Return the custom class object
  by_hand_list <- lapply(as.data.frame(by_hand), function(col) {setNames(col, rownames(by_hand))})
  return(by_hand_list)
}
