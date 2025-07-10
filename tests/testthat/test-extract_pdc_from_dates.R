test_that("use", {
  pdc_courses_text <- get_pdc_test_courses_text()
  from_dates <- extract_pdc_from_dates(pdc_courses_text)
  expect_equal(length(pdc_courses_text), length(from_dates))
})
