test_that("use", {
  expect_true(is_correctly_formatted_date("1234-11-12"))
  expect_false(is_correctly_formatted_date("Feb 12"))
})
