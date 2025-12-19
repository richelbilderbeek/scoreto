test_that("use", {
  expect_true(length(get_provider_logos_as_markdown(get_all_providers())) > 1)
})
