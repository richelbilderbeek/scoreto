test_that("use", {
  t <- get_uppmax_courses()
  expect_true(is_correctly_formatted_courses_table(t))
})
