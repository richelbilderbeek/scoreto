test_that("use", {
  expect_true(is_valid_link("https://nbisweden.github.io/SCoRe_user_doc"))
  expect_false(is_valid_link(url = "https://nbisweden.github.io/SCoRe_user_doc/nonsense_url"))
  expect_true(is_valid_link(url = "https://docs.uppmax.uu.se/courses_workshops/intro_to_python/"))
  expect_false(is_valid_link(url = "https://nonsense.url"))
  expect_true(is_valid_link(url = "https://enccs.se/events"))
})
