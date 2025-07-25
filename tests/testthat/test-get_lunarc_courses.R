test_that("use from website", {
  t <- get_lunarc_courses()
  expect_true(is_correctly_formatted_courses_table(t))

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

test_that("use from testing URL", {
  t <- get_lunarc_courses(html_text = get_test_lunarc_html())
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
