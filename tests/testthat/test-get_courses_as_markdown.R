test_that("use", {
  expect_silent(get_courses_as_markdown(t = get_test_courses_table()))
})
