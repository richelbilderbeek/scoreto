test_that("use", {
  csc_courses_text <- get_csc_test_courses_text()
  course_names <- extract_csc_course_names(csc_courses_text)
  expect_equal(length(csc_courses_text), length(course_names))
})
