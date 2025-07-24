test_that("us", {
  t <- get_other()
  expect_true(is_correctly_formatted_other_table(t))

  u <- "Nonsense"
  expect_false(is_correctly_formatted_other_table(u))

  u <- t
  u$name <- NULL
  expect_false(is_correctly_formatted_other_table(u))

  u <- t
  names(u) <- c(names(t)[-1], "nonsense_name")
  expect_false(is_correctly_formatted_other_table(u))
})
