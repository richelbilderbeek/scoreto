test_that("use", {
  expect_true(is_valid_link("https://nbisweden.github.io/SCoRe_user_doc"))
  expect_false(is_valid_link(url = "https://nbisweden.github.io/SCoRe_user_doc/nonsense_url"))
  expect_true(is_valid_link(url = "https://docs.uppmax.uu.se/courses_workshops/intro_to_python/"))
  expect_false(is_valid_link(url = "https://nonsense.url"))
  expect_true(is_valid_link(url = "https://enccs.se/events"))
  expect_false(is_valid_link(url = "https://www.pdc.kth.se/about/events/about/events/pdc-summer-school-2025-introduction-to-high-performance-computing-1.1389436?date=2025-08-14&orgdate=2025-07-21&length=1&orglength=0"))
})
