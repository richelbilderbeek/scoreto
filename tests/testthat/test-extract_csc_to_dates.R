test_that("use", {
  csc_date_ranges <- c(
    "18.-20.11.2025",
    "25.11.2025",
    "25.-27.11.2025",
    "2.-4.12.2025",
    "22.1.2026"
  )
  to_dates <- extract_csc_to_dates(csc_date_ranges = csc_date_ranges)
  expect_equal(length(to_dates), length(csc_date_ranges))
})
