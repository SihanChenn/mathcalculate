test_that("predictY works", {
  library(MASS)
  data(Boston)
  y=Boston$medv
  x <- as.matrix(Boston[, -which(names(Boston) == "medv")])
  result=linear_regress(y,x)
  lm_fit <- lm(y ~ x)
  y_hat=PredictY(x,result[["Estimate"]])
  expect_equal(y_hat, predict(lm_fit), tolerance = 1e-5)
})
