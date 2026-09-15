test_that("use", {
  t <- get_uppmax_courses()
  expect_true(is_correctly_formatted_courses_table(t))
  expect_true(all(as.logical(RCurl::url.exists(t$course_url))))

})

test_that("use, 2026-08-17", {
  t <- get_uppmax_courses(html_text = readr::read_lines(get_scoreto_path("uppmax_20260817.html"))) # nolint
  expect_true(is_correctly_formatted_courses_table(t))
  scoreto::get_provider_courses_url("UPPMAX")
})

test_that("use, 2026-09-15", {
  # Here the UPPMAX text was incomplete
  expect_error(
    get_uppmax_courses(html_text = readr::read_lines(get_scoreto_path("uppmax_20260915.html"))) # nolint
  )
  scoreto::get_provider_courses_url("UPPMAX")
})

