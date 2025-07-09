test_that("minimal use", {
  expect_equal(
    length(extract_uppmax_to_dates(c("Aug 25-27", "Oct 14"))),
    2
  )
})
