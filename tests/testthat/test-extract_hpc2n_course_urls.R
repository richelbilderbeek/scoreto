test_that("use", {
  hpc2n_courses_text <- get_hpc2n_test_courses_text()
  course_urls <- extract_hpc2n_course_urls(hpc2n_courses_text)
  expect_equal(length(hpc2n_courses_text), length(course_urls))
})
