test_that("us", {
  t <- get_compute()
  expect_true(is_correctly_formatted_compute_table(t))

  u <- "Nonsense"
  expect_false(is_correctly_formatted_compute_table(u))

  u <- t
  u$hpc_cluster <- NULL
  expect_false(is_correctly_formatted_compute_table(u))

  u <- t
  names(u) <- c(names(t)[-1], "nonsense_name")
  expect_false(is_correctly_formatted_other_table(u))

})
