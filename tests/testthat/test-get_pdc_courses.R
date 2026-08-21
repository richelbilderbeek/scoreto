test_that("minimal use", {
  t <- get_pdc_courses()
  expect_silent(check_courses_table(t))
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
  t <- get_pdc_courses(html_text = readr::read_lines(get_scoreto_path("pdc_no_events.html"))) # nolint
  expect_true(is_correctly_formatted_courses_table(t))
})

test_that("2026-08-21", {
  t <- get_pdc_courses(html_text = readr::read_lines(get_scoreto_path("pdc_20260821.html"))) # nolint
  expect_silent(check_courses_table(t))
})
