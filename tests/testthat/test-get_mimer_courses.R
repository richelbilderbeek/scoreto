test_that("use", {
  t <- get_mimer_courses(html_text = get_mimer_html())
  expect_true(is_correctly_formatted_courses_table(t))
})

test_that("use on obsolete testing data", {
  t <- get_mimer_courses(html_text = get_test_mimer_html())
  expect_true(is_correctly_formatted_courses_table(t))
})
