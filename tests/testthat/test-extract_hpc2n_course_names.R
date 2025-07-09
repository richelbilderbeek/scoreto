test_that("use", {
  hpc2n_courses_text <- get_hpc2n_test_courses_text()
  course_names <- extract_hpc2n_course_names(hpc2n_courses_text)
  expect_equal(length(hpc2n_courses_text), length(course_names))
})
