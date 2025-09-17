test_that("use", {
  hpc2n_courses_text <- get_hpc2n_test_courses_text()
  from_dates <- extract_hpc2n_from_dates(hpc2n_courses_text)
  expect_equal(length(hpc2n_courses_text), length(from_dates))
})

test_that("use, 2025-09-17", {
  hpc2n_courses_text <- "<li>Intermediate Bash, aka Command Line 201, 4-5 December </li>"
  from_dates <- extract_hpc2n_from_dates(hpc2n_courses_text)
  expect_equal(length(hpc2n_courses_text), length(from_dates))
})

test_that("use, 2025-09-17", {
  hpc2n_courses_text <- "<li>Introduction to running Python in HPC + Using Python in an HPC environment, 27 Nov, 28 Nov, Dec 1, Dec 2</li>"
  from_dates <- extract_hpc2n_from_dates(hpc2n_courses_text)
  expect_equal(length(hpc2n_courses_text), length(from_dates))
})
