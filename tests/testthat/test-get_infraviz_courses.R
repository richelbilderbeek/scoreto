test_that("use", {
  t <- get_infraviz_courses()
  expect_true(is_correctly_formatted_courses_table(t))
})

test_that("use on testing data", {
  t <- get_infraviz_courses(html_text = get_test_infraviz_html())
  expect_true(is_correctly_formatted_courses_table(t))
})
