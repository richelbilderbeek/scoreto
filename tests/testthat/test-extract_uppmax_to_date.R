test_that("minimal use", {
  expect_equal(
    extract_uppmax_to_date("Aug 25-27"),
    paste0(lubridate::year(lubridate::today()), "-08-27")
  )
  expect_equal(
    extract_uppmax_to_date("Oct 14"),
    paste0(lubridate::year(lubridate::today()), "-10-14")
  )
  expect_equal(
    extract_uppmax_to_date("Oct 23-24 + 27-29"),
    paste0(lubridate::year(lubridate::today()), "-10-29")
  )
  expect_equal(
    extract_uppmax_to_date("Nov 27-28"),
    paste0(lubridate::year(lubridate::today()), "-11-28")
  )
  expect_equal(
    extract_uppmax_to_date("Dec 1-2"),
    paste0(lubridate::year(lubridate::today()), "-12-02")
  )
})
