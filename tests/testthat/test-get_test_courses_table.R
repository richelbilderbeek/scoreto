test_that("use", {
  expect_silent(get_test_courses_table())
  expect_true(is_correctly_formatted_table(get_test_courses_table()))
})
