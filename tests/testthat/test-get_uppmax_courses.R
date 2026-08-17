test_that("use, 2026-08-17", {
  t <- get_uppmax_courses(html_text = readr::read_lines(get_scoreto_path("uppmax_20260817.html"))) # nolint
  expect_true(is_correctly_formatted_courses_table(t))
})

