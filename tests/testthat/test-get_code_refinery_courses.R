test_that("use", {
  t <- get_code_refinery_courses()
  expect_true(is_correctly_formatted_table(t))
})
