test_that("use", {
  expect_silent(get_hpc2n_test_courses_text())
  expect_true(length(get_hpc2n_test_courses_text()) > 6)
})
