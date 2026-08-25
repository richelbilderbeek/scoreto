test_that("use", {
  expect_silent(get_test_courses_table())
  t <- get_test_courses_table()
  expect_silent(check_courses_table(t))
  expect_true(is_correctly_formatted_courses_table(get_test_courses_table()))
})
