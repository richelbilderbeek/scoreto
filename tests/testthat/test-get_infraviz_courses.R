test_that("use", {
  t <- get_infraviz_courses(html_text = get_infraviz_html())
  expect_true(is_correctly_formatted_courses_table(t))
})

test_that("use on testing data", {
  t <- get_infraviz_courses(html_text = get_test_infraviz_html())
  expect_true(is_correctly_formatted_courses_table(t))
})

test_that("use on testing data 1", {
  html_text <- readr::read_lines(
    scoreto::get_scoreto_path("infraviz_20251202.html")
  )
  t <- get_infraviz_courses(html_text = html_text)
  expect_true(is_correctly_formatted_courses_table(t))
})
