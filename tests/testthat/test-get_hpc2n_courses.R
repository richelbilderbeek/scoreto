test_that("use", {
  t <- get_hpc2n_courses()
  expect_true(is_correctly_formatted_table(t))
})
