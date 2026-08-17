test_that("use", {
  expect_true(all(are_valid_urls(urls = get_all_providers_info()$home_url)))
})
