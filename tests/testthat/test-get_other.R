test_that("use", {
  expect_silent(get_other())
})

test_that("Some column values start with uppercase", {
  t <- get_other()
  expect_true(all(stringr::str_detect(t$description, "^[:upper:]")))
  expect_true(all(stringr::str_detect(t$user_costs, "^\\[?[:upper:]")))
  expect_true(all(stringr::str_detect(t$accessible_for, "^[:upper:]")))
})
