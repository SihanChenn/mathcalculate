test_that("linear_regress works", {
  library(MASS)
  data(Boston)
  y=Boston$medv
  x <- as.matrix(Boston[, -which(names(Boston) == "medv")])
  result=linear_regress(y,x)
  lm_fit <- lm(y ~ x)
  summary_fit=summary(lm_fit)
  expected_values <- list(
    Estimate = coef(lm_fit),
    Std_Err = summary_fit$coefficients[, "Std. Error"],
    t_statistic = summary_fit$coefficients[, "t value"],
    p_value = summary_fit$coefficients[, "Pr(>|t|)"]
  )
  expect_equal(
    list(
      Estimate = result[["Estimate"]],
      Std_Err = result[["Std_Err"]],
      t_statistic = result[["t_statistic"]],
      p_value = result[["p_value"]]
    ),
    expected_values,
    tolerance = 1e-5
  )

  data("mtcars")
  y=mtcars$mpg
  x <- as.matrix(mtcars[, -which(names(mtcars) == "mpg")])
  result=linear_regress(y,x)
  lm_fit <- lm(y ~ x)
  summary_fit=summary(lm_fit)
  expected_values <- list(
    Estimate = coef(lm_fit),
    Std_Err = summary_fit$coefficients[, "Std. Error"],
    t_statistic = summary_fit$coefficients[, "t value"],
    p_value = summary_fit$coefficients[, "Pr(>|t|)"]
  )
  expect_equal(
    list(
      Estimate = result[["Estimate"]],
      Std_Err = result[["Std_Err"]],
      t_statistic = result[["t_statistic"]],
      p_value = result[["p_value"]]
    ),
    expected_values,
    tolerance = 1e-5
  )

  data(airquality)
  airquality_clean <- na.omit(airquality)
  y=airquality_clean$Ozone
  x <- cbind(airquality_clean$Temp,airquality_clean$Wind,airquality_clean$Solar.R,airquality_clean$Month)
  result=linear_regress(y,x)
  lm_fit <- lm(y ~ x)
  summary_fit=summary(lm_fit)
  expected_values <- list(
    Estimate = coef(lm_fit),
    Std_Err = summary_fit$coefficients[, "Std. Error"],
    t_statistic = summary_fit$coefficients[, "t value"],
    p_value = summary_fit$coefficients[, "Pr(>|t|)"]
  )
  expect_equal(
    list(
      Estimate = result[["Estimate"]],
      Std_Err = result[["Std_Err"]],
      t_statistic = result[["t_statistic"]],
      p_value = result[["p_value"]]
    ),
    expected_values,
    tolerance = 1e-5
  )
 })
