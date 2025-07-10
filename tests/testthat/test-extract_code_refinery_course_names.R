test_that("use", {
  code_refinery_courses_text <- get_code_refinery_test_courses_text()
  course_names <- extract_code_refinery_course_names(code_refinery_courses_text)
  expect_equal(length(code_refinery_courses_text), length(course_names))
})
