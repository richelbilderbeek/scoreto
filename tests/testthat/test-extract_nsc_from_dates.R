test_that("use", {
  nsc_courses_text <- get_nsc_test_courses_text()
  from_dates <- extract_nsc_from_dates(nsc_courses_text)
  expect_equal(length(nsc_courses_text), length(from_dates))
})
