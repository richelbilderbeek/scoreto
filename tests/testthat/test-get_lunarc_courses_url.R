test_that("use", {
  expect_silent(get_lunarc_courses_url())
})

test_that("URL must exist", {
  expect_true(is_valid_link(get_lunarc_courses_url()))
})
