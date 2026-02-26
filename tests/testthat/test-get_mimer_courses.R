test_that("use", {
  t <- get_mimer_courses(html_text = get_mimer_html())
  expect_true(is_correctly_formatted_courses_table(t))
})

test_that("ubse on testing data", {
  t <- get_mimer_courses(html_text = get_test_mimer_html())
  expect_true(is_correctly_formatted_courses_table(t))
})

test_that("use on testing data 2", {
  html_text <- readr::read_lines(scoreto::get_scoreto_path("mimer_20260225.html"))
  t <- get_mimer_courses(html_text = html_text)
  expect_true(is_correctly_formatted_courses_table(t))
})


