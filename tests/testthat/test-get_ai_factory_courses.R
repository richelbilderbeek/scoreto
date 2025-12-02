test_that("use", {
  t <- get_ai_factory_courses(html_text = get_ai_factory_html())
  expect_true(is_correctly_formatted_courses_table(t))
})

test_that("use on testing data", {
  t <- get_ai_factory_courses(html_text = get_test_ai_factory_html())
  expect_true(is_correctly_formatted_courses_table(t))
})
