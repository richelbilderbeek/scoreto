test_that("use", {
  expect_silent(get_storage())
})

test_that("file storage.csv is OK", {
  expect_silent(get_storage(check_file = TRUE))
})

test_that("Some column values start with uppercase", {
  t <- get_storage()

  expect_true(all(stringr::str_detect(t$data_sensitivity, "^[:upper:]")))
  expect_true(all(stringr::str_detect(t$data_activity, "^[:upper:]")))
  expect_true(all(stringr::str_detect(t$user_costs, "^\\[?[:upper:]")))
  expect_true(all(stringr::str_detect(t$accessible_for, "^[:upper:]")))
})

