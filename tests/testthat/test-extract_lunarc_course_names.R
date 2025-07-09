test_that("use", {
  lunarc_courses_text <- get_lunarc_test_courses_text()
  course_names <- extract_lunarc_course_names(lunarc_courses_text)
  expect_equal(length(lunarc_courses_text), length(course_names))
})
