test_that("use", {
  slubi_courses_text <- get_slubi_test_courses_text()
  from_dates <- extract_slubi_from_dates(slubi_courses_text)
  course_names <- extract_slubi_course_names(slubi_courses_text)
  expect_equal(length(course_names), length(from_dates))
})
