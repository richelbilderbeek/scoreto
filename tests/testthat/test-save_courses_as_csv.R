test_that("use", {
  filename <- tempfile()
  expect_false(file.exists(filename))
  save_courses_as_csv(filename)
  expect_true(file.exists(filename))
  t <- readr::read_csv(filename)
})
