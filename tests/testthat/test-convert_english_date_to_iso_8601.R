test_that("use", {
  expect_equal(
    "2025-11-25",
    convert_english_date_to_iso_8601(english_date = "25 November 2025")
  )
  expect_equal(
    "2025-09-01",
    convert_english_date_to_iso_8601(english_date = "September/October 2025")
  )
  expect_equal(
    "2025-11-03",
    convert_english_date_to_iso_8601(english_date = "Nov 3 2025")
  )
  expect_equal(
    paste0(lubridate::year(lubridate::today()), "-01-19"),
    convert_english_date_to_iso_8601(english_date = "Jan 19")
  )
})
