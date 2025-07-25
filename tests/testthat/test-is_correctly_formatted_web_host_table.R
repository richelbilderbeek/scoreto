test_that("us", {
  t <- get_web_host()
  expect_true(is_correctly_formatted_web_host_table(t))

  u <- "Nonsense"
  expect_false(is_correctly_formatted_web_host_table(u))

  u <- t
  u$web_host <- NULL
  expect_false(is_correctly_formatted_web_host_table(u))

  u <- t
  names(u) <- c(names(t)[-1], "nonsense_name")
  expect_false(is_correctly_formatted_web_host_table(u))

})
