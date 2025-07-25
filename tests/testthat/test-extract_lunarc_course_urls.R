test_that("use", {
  lunarc_courses_text <- get_lunarc_test_courses_text()
  course_urls <- extract_lunarc_course_urls(lunarc_courses_text)
  expect_equal(length(lunarc_courses_text), length(course_urls))
  course_urls[1] == "https://www.lunarc.lu.se/learning-more/training-courses/cluster-architecture-and-job-submission-2-september-2025/"
  expect_equal(
    0,
    sum(stringr::str_detect(t$course_url, "learning-more/training-courses/learning-more/training-courses"))
  )

})
