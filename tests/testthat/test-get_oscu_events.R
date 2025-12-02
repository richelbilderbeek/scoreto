test_that("use", {
  t <- get_oscu_events(html_text = get_oscu_html())
  expect_true(is_correctly_formatted_courses_table(t))
})

test_that("use on testing data", {
  t <- get_oscu_events(html_text = get_test_oscu_html())
  expect_true(is_correctly_formatted_courses_table(t))
})
