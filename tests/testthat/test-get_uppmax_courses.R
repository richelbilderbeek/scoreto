test_that("use", {
  t <- get_uppmax_courses()
  expect_true(is_correctly_formatted_courses_table(t))
})

test_that("use on testing data, 2026-03-13", {

  t <- get_uppmax_courses(html_text = readr::read_lines(get_scoreto_path("uppmax_20260313.html")))
  expect_true(is_correctly_formatted_courses_table(t))
})

