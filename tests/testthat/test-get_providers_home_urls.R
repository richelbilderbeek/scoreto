test_that("minimal use", {

  provider_names <- get_all_providers()
  home_urls <- get_providers_home_urls(provider_names = provider_names)
  expect_equal(length(provider_names), length(home_urls))
})

test_that("no trailing backslash", {

  provider_names <- get_all_providers()
  home_urls <- get_providers_home_urls(provider_names = provider_names)
  expect_true(all(stringr::str_detect(home_urls, "/$") == FALSE))
})

test_that("homepage must exist", {

  home_urls <- get_providers_home_urls(get_all_providers())
  for (home_url in home_urls) {
    expect_true(is_valid_link(url = home_url))
  }
})
