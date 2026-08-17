test_that("use", {
  for (provider_name in get_all_providers()) {
    url <- get_provider_courses_url(provider_name)
    if (url == "unknown") next
    if (url == "-") next
    expect_true(is_valid_url(url = url), paste0("Invalid URL: ", url))
  }
})
