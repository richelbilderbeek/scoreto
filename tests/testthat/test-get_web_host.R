test_that("use", {
  expect_silent(get_web_host())
})

test_that("Some column values start with uppercase", {
  t <- get_web_host()
  expect_true(all(stringr::str_detect(t$deploy_type, "^[:upper:]")))
  expect_true(all(stringr::str_detect(t$data_sensitivity, "^[:upper:]")))
  expect_true(all(stringr::str_detect(t$user_costs, "^\\[?[:upper:]")))
  expect_true(all(stringr::str_detect(t$accessible_for, "^[:upper:]")))
})
