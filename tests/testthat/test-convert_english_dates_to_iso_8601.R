test_that("use", {
  expect_equal(
    "2025-11-25",
    convert_english_dates_to_iso_8601(english_dates = "25 November 2025")
  )
  expect_equal(
    "2025-09-01",
    convert_english_dates_to_iso_8601(english_dates = "September/October 2025")
  )
})
