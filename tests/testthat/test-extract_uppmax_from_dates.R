test_that("minimal use", {
  uppmax_dates <- c("Aug 25-27", "Oct 14", "Oct 23-24 + 27-29")
  from_dates <- extract_uppmax_from_dates(uppmax_dates)
  expect_equal(length(uppmax_dates), length(from_dates))
  expect_equal(0, length(names(from_dates)))
})
