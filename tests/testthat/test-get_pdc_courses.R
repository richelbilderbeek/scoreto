test_that("minimal use", {
  t <- get_pdc_courses()
  expect_true(is_correctly_formatted_courses_table(t))
})

test_that("use correct URLs", {
  t <- get_pdc_courses()
  expect_equal(
    0,
    sum(stringr::str_detect(t$course_url, "about/events/about/events"))
  )
})

test_that("elegantly process no courses", {
  t <- get_pdc_courses(html_text = get_scoreto_path("pdc_no_events.html"))
  expect_true(is_correctly_formatted_courses_table(t))
})
