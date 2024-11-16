test_that("predictY works", {
  #test 1
  library(MASS)
  data(Boston)
  #set up x and y
  y = Boston$medv
  x = as.matrix(Boston[, -which(names(Boston) == "medv")])
  #get result from linear_regress and lm function in R
  result = linear_regress(y, x)
  lm_fit = lm(y ~ x)
  #get predicted values from PredictY and predict function in R
  y_hat = PredictY(x, result[["Estimate"]])
  expect_equal(y_hat, predict(lm_fit), tolerance = 1e-5)

  #test 2
  data("mtcars")
  #set up x and y
  y = mtcars$mpg
  x = as.matrix(mtcars[, -which(names(mtcars) == "mpg")])
  #get result from linear_regress and lm function in R
  result = linear_regress(y, x)
  lm_fit = lm(y ~ x)
  #get predicted values from PredictY and predict function in R
  y_hat = PredictY(x, result[["Estimate"]])
  expect_equal(y_hat, predict(lm_fit), tolerance = 1e-5)

  #test 3
  data(airquality)
  #set up x and y
  airquality_clean = na.omit(airquality)
  y = airquality_clean$Ozone
  x = cbind(
    airquality_clean$Temp,
    airquality_clean$Wind,
    airquality_clean$Solar.R,
    airquality_clean$Month
  )
  #get result from linear_regress and lm function in R
  result = linear_regress(y, x)
  lm_fit = lm(y ~ x)
  #get predicted values from PredictY and predict function in R
  y_hat = PredictY(x, result[["Estimate"]])
  expect_equal(y_hat, predict(lm_fit), tolerance = 1e-5)
})
