test_that("use", {
  nsc_courses_text <- get_nsc_test_courses_text()
  course_names <- extract_nsc_course_names(nsc_courses_text)
  expect_equal(length(nsc_courses_text), length(course_names))
})
