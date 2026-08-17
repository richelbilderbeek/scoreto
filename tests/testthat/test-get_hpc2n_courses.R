test_that("use on today's data", {
  t <- get_hpc2n_courses()
  expect_true(is_correctly_formatted_courses_table(t))
  expect_true(all(as.logical(RCurl::url.exists(t$course_url))))
})

test_that("use on testing data", {
  t <- get_hpc2n_courses(html_text = get_test_hpc2n_html())
  expect_true(is_correctly_formatted_courses_table(t))
})

test_that("use, 2026-08-17", {
  t <- get_hpc2n_courses(html_text = readr::read_lines(get_scoreto_path("hpc2n_20260817.html"))) # nolint
  expect_true(is_correctly_formatted_courses_table(t))
})


