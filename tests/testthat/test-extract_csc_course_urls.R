test_that("use", {
  csc_courses_text <- get_csc_test_courses_text()
  course_urls <- extract_csc_course_urls(csc_courses_text)
  expect_equal(length(csc_courses_text), length(course_urls))
})
