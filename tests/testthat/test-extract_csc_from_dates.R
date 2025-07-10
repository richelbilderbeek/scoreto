test_that("use", {
  csc_courses_text <- get_csc_test_courses_text()
  from_dates <- extract_csc_from_dates(csc_courses_text)
  expect_equal(length(csc_courses_text), length(from_dates))
})
