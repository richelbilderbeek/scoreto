test_that("use", {
  get_provider_courses_url("C3SE")
  t <- get_c3se_courses()
  expect_true(is_correctly_formatted_courses_table(t))
})

test_that("use on testing data, 2026-03-11", {
  t <- get_c3se_courses(html_text = readr::read_lines(get_scoreto_path("c3se_20260311.html")))
  expect_true(is_correctly_formatted_courses_table(t))
})

test_that("use on testing data, 2026-03-25", {
  t <- get_c3se_courses(html_text = readr::read_lines(get_scoreto_path("c3se_20260325.html")))
  expect_true(is_correctly_formatted_courses_table(t))
})

test_that("use on testing data, 2026-03-31", {
  t <- get_c3se_courses(html_text = readr::read_lines(get_scoreto_path("c3se_20260331.html")))
  expect_true(is_correctly_formatted_courses_table(t))
})

