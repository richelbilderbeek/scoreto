test_that("use", {
  expect_silent(get_storage())
})

test_that("file storage.csv is OK", {
  expect_silent(get_storage(check_file = TRUE))
})

