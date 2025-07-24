test_that("use", {
  expect_silent(get_compute())
})

test_that("Some column values start with uppercase", {
  t <- get_compute()
  expect_true(all(stringr::str_detect(t$compute_type, "^[:upper:]")))
  expect_true(all(stringr::str_detect(t$data_type, "^[:upper:]")))
  expect_true(all(stringr::str_detect(t$user_costs, "^\\[?[:upper:]")))
  expect_true(all(stringr::str_detect(t$accessible_for, "^[:upper:]")))
})
