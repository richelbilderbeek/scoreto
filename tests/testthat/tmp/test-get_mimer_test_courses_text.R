test_that("use", {
  expect_silent(get_mimer_test_courses_text())
  expect_true(length(get_mimer_test_courses_text()) > 6)
})
