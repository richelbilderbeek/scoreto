test_that("use on today's data", {
  t <- get_hpc2n_courses()
  expect_silent(check_courses_table(t))
  expect_true(all(as.logical(RCurl::url.exists(t$course_url))))
  get_provider_courses_url("HPC2N")
})

test_that("use, 2026-08-17", {
  t <- get_hpc2n_courses(html_text = readr::read_lines(get_scoreto_path("hpc2n_20260817.html"))) # nolint
  expect_error(check_courses_table(t)) # Has a fault URL
})

test_that("use, 2026-08-21", {
  t <- get_hpc2n_courses(html_text = readr::read_lines(get_scoreto_path("hpc2n_20260821.html"))) # nolint
  expect_silent(check_courses_table(t))
})


