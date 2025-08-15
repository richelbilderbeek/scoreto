test_that("minimal use", {
  expect_equal(extract_sll_from_date("9 - 11 September 2025"), "2025-09-09")
  expect_equal(extract_sll_from_date("6 - 31 October 2025"), "2025-10-06")
  expect_equal(extract_sll_from_date("24 - 28 November 2025"), "2025-11-24")
  expect_equal(
    extract_sll_from_date(
      sll_date_range = c("9 - 11 September 2025", "24 - 28 November 2025")
    ),
    c("2025-09-09", "2025-11-24")
  )
  expect_equal(
    extract_sll_from_date(sll_date_range = "1 July - 31 December 2025"),
    "2025-07-01"
  )
})
