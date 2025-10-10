test_that("use", {
  t <- create_test_courses_table()
  expect_true(is_correctly_formatted_courses_table(t))
})
