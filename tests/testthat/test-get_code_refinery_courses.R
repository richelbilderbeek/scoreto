test_that("use on today's data", {
  t <- get_code_refinery_courses()
  expect_true(is_correctly_formatted_courses_table(t))
})

test_that("use on testing data", {
  t <- get_code_refinery_courses(html_text = get_test_code_refinery_html())
  expect_true(is_correctly_formatted_courses_table(t))
})

test_that("use on testing data, 2026-01-30", {
  t <- get_code_refinery_courses(html_text = readr::read_lines(get_scoreto_path("code_refinery_20260130.html")))
  expect_true(is_correctly_formatted_courses_table(t))
})

test_that("use on testing data, 2026-02-28", {
  t <- get_code_refinery_courses(html_text = readr::read_lines(get_scoreto_path("code_refinery_20260228.html")))
  expect_true(is_correctly_formatted_courses_table(t))
})

