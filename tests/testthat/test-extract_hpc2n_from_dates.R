test_that("use", {
  hpc2n_courses_text <- get_hpc2n_test_courses_text()
  from_dates <- extract_hpc2n_from_dates(hpc2n_courses_text)
  expect_equal(length(hpc2n_courses_text), length(from_dates))
})
