test_that("minimal use", {
  expect_equal(extract_sll_to_date("9 - 11 September 2025"), "2025-09-11")
  expect_equal(extract_sll_to_date("6 - 31 October 2025"), "2025-10-31")
  expect_equal(extract_sll_to_date("24 - 28 November 2025"), "2025-11-28")
  expect_equal(
    extract_sll_to_date(c("6 - 31 October 2025", "24 - 28 November 2025")),
    c("2025-10-31", "2025-11-28")
  )
})
