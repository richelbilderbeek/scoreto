test_that("use", {
  code_refinery_courses_text <- get_code_refinery_test_courses_text()
  course_urls <- extract_code_refinery_course_urls(code_refinery_courses_text)
  expect_equal(length(code_refinery_courses_text), length(course_urls))
})
