test_that("linear_regress works", {
  library(MASS)
  data(Boston)
  y=Boston$medv
  x <- as.matrix(Boston[, -which(names(Boston) == "medv")])
  result=linear_regress(y,x)
  lm_fit <- lm(y ~ x)
  expect_equal(result[["Estimate"]], coef(lm_fit), tolerance = 1e-5)
})
