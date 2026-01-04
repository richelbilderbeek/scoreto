test_that("use", {
  t <- get_nsc_courses()
  expect_true(is_correctly_formatted_courses_table(t))
})

test_that("use on test HTML", {
  html_text <- readr::read_lines(get_scoreto_path("nsc.html"))
  t <- get_nsc_courses(html_text)
  expect_true(is_correctly_formatted_courses_table(t))
})

test_that("use on test HTML", {
  html_text <- readr::read_lines(get_scoreto_path("nsc_20260104.html"))
  t <- get_nsc_courses(html_text)
  expect_true(is_correctly_formatted_courses_table(t))
})
