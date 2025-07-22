test_that("use", {
  filename <- tempfile()
  expect_false(file.exists(filename))
  save_compute_as_csv(filename)
  expect_true(file.exists(filename))
  t <- readr::read_csv(filename)
  expect_true(tibble::is_tibble(t))
})
