test_that("minimal use", {
  t <- create_test_courses_table()
  expect_silent(check_courses_table(t))
})
