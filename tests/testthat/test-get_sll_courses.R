test_that("use on today's data", {
  t <- get_sll_courses()
  expect_true(is_correctly_formatted_courses_table(t))
})

test_that("use on testing data, 2026-03-25", {
  t <- get_sll_courses(html_text = readr::read_lines(get_scoreto_path("sll_20260325.html")))
  expect_true(is_correctly_formatted_courses_table(t))
})
