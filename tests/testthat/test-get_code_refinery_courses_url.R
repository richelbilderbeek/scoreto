test_that("use", {
  expect_silent(get_code_refinery_courses_url())
})

test_that("URL must exist", {
  expect_true(is_valid_link(get_code_refinery_courses_url()))
})
