test_that("use", {
  expect_no_warning(check_providers_info_file())
  expect_no_error(check_providers_info_file())
})
