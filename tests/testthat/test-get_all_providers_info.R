test_that("use", {
  t <- get_all_providers_info()
  expect_true(tibble::is_tibble(t))
  expect_true("name" %in% names(t))
  expect_true("home_url" %in% names(t))
  expect_true("courses_url" %in% names(t))
})
