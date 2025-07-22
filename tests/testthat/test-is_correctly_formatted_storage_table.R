test_that("us", {
  t <- get_storage()
  expect_true(is_correctly_formatted_storage_table(t))

  u <- "Nonsense"
  expect_false(is_correctly_formatted_storage_table(u))

  u <- t
  u$storage_system <- NULL
  expect_false(is_correctly_formatted_storage_table(u))
})
