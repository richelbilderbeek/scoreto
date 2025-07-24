test_that("use", {
  expect_silent(get_scoreto_path("compute.csv"))
  expect_error(get_scoreto_path("nonsense"))
})
