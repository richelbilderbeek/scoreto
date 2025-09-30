test_that("use", {
  slubi_courses_text <- get_slubi_test_courses_text()
  course_urls <- extract_slubi_course_urls(slubi_courses_text)
  course_names <- extract_slubi_course_names(slubi_courses_text)
  expect_equal(length(course_urls), length(course_names))
})
