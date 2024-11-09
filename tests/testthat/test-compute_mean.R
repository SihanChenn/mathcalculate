test_that("compute_mean works", {
  expect_equal(compute_mean(2), 2)
  expect_equal(compute_mean(c(2,3,4)), 3)
  expect_equal(compute_mean(c(2,7,9,0,2)), 4)

})
