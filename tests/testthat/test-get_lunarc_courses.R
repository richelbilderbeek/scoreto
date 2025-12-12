test_that("use from website", {
  t <- get_lunarc_courses(html_text = get_lunarc_html())
  expect_true(is_correctly_formatted_courses_table(t))
})

test_that("use on testing data", {
  t <- get_lunarc_courses(html_text = get_test_lunarc_html())
  expect_true(is_correctly_formatted_courses_table(t))
})
