test_that("use", {
  expect_silent(get_slubi_test_courses_text())
  expect_true(length(get_slubi_test_courses_text()) > 6)
})
