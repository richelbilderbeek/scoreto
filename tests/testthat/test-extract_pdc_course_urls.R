test_that("use", {
  pdc_courses_text <- get_pdc_test_courses_text()
  course_urls <- extract_pdc_course_urls(pdc_courses_text)
  expect_equal(length(pdc_courses_text), length(course_urls))
})
