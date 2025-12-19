test_that("use", {
  text <- get_all_provider_logos_as_markdown()
  expect_true(length(text) > 0)
  logo_text <- stringr::str_subset(text, "https")
  expect_true(all(stringr::str_sub(logo_text, 1, 3) == "[!["))
})
