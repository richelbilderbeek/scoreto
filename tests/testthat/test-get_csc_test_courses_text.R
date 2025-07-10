test_that("use", {
  expect_silent(get_csc_test_courses_text())
  csc_courses_text <- get_csc_test_courses_text()
  expect_true(length(csc_courses_text) > 6)
})
