test_that("use", {
  csc_courses_text <- get_csc_test_courses_text()
  to_dates <- extract_csc_to_dates(csc_courses_text)
  expect_equal(length(to_dates), 2)
})
