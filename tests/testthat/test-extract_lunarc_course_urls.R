test_that("use", {
  lunarc_courses_text <- get_lunarc_test_courses_text()
  course_urls <- extract_lunarc_course_urls(lunarc_courses_text)
  expect_equal(length(lunarc_courses_text), length(course_urls))
  expect_equal(
    0,
    sum(
      stringr::str_detect(
        t$course_url,
        "learning-more/training-courses/learning-more/training-courses"
      )
    )
  )

})
