test_that("predictY works", {
  library(MASS)
  data(Boston)
  y=Boston$medv
  x <- as.matrix(Boston[, -which(names(Boston) == "medv")])
  result=linear_regress(y,x)
  lm_fit <- lm(y ~ x)
  y_hat=PredictY(x,result[["Estimate"]])
  expect_equal(y_hat, predict(lm_fit), tolerance = 1e-5)

  data("mtcars")
  y=mtcars$mpg
  x <- as.matrix(mtcars[, -which(names(mtcars) == "mpg")])
  result=linear_regress(y,x)
  lm_fit <- lm(y ~ x)
  y_hat=PredictY(x,result[["Estimate"]])
  expect_equal(y_hat, predict(lm_fit), tolerance = 1e-5)

  data(airquality)
  airquality_clean <- na.omit(airquality)
  y=airquality_clean$Ozone
  x <- cbind(airquality_clean$Temp,airquality_clean$Wind,airquality_clean$Solar.R,airquality_clean$Month)
  result=linear_regress(y,x)
  lm_fit <- lm(y ~ x)
  y_hat=PredictY(x,result[["Estimate"]])
  expect_equal(y_hat, predict(lm_fit), tolerance = 1e-5)
})
