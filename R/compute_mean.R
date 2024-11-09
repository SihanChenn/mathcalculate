#'compute_mean
#'
#'Gets the mean of a vector
#'
#'@param x input value
#'
#'@return the mean of x
#'
#'@examples
#'compute_mean(3)
#'compute_mean(c(1,2,4,3)
#'
#'@export
#'
compute_mean<-function(x){
  mean=sum(x)/length(x)
  return(mean)
}
