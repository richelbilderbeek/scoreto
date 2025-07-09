test_that("use", {
  enccs_dates <- c("Jul 10", "Sep 18", "Sep 18", "Oct 9", "Oct 22", "Nov 7")
  results <- convert_enccs_dates(enccs_dates)
  expect_equal(length(enccs_dates), length(results))
  expect_true(all(nchar(results) == 10))
})
