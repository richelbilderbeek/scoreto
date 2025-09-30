test_that("use", {
  slubi_courses_text <- get_slubi_test_courses_text()
  to_dates <- extract_slubi_to_dates(slubi_courses_text)
  course_names <- extract_slubi_course_names(slubi_courses_text)
  expect_equal(length(to_dates), length(course_names))
})
