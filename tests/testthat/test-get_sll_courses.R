test_that("use on today's data", {
  t <- get_sll_courses()
  expect_true(is_correctly_formatted_courses_table(t))
})

test_that("use on testing data", {
  t <- get_sll_courses(html_text = get_test_sll_html())
  expect_true(is_correctly_formatted_courses_table(t))
})
