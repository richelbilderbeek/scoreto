test_that("use", {
  nsc_courses_text <- get_nsc_test_courses_text()
  to_dates <- extract_nsc_to_dates(nsc_courses_text)
  expect_equal(length(nsc_courses_text), length(to_dates))
})
