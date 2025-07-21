test_that("use", {
  expect_true(is_valid_link("https://nbisweden.github.io/SCoRe_user_doc"))
  expect_false(is_valid_link("https://nbisweden.github.io/SCoRe_user_doc/nonsense_url"))
})
