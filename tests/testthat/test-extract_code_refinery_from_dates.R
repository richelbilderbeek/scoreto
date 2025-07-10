test_that("use", {
  code_refinery_courses_text <- get_code_refinery_test_courses_text()
  from_dates <- extract_code_refinery_from_dates(code_refinery_courses_text)
  expect_equal(length(code_refinery_courses_text), length(from_dates))
})
