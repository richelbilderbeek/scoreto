test_that("use", {
  csc_date_range <- "18.-20.11.2025"
  to_date <- extract_csc_to_date(csc_date_range = csc_date_range)
  expect_equal(to_date, "2025-11-20")

  csc_date_range <- "25.11.2025"
  to_date <- extract_csc_to_date(csc_date_range = csc_date_range)
  expect_equal(to_date, "2025-11-25")

  csc_date_range <- "25.-27.11.2025"
  to_date <- extract_csc_to_date(csc_date_range = csc_date_range)
  expect_equal(to_date, "2025-11-27")

  csc_date_range <- "2.-4.12.2025"
  to_date <- extract_csc_to_date(csc_date_range = csc_date_range)
  expect_equal(to_date, "2025-12-04")
})
