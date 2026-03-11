test_that("use", {
  t <- get_c3se_courses()
  expect_true(is_correctly_formatted_courses_table(t))
})

test_that("use on testing data", {
  # HIERO
  t <- get_c3se_courses(html_text = readr::read_lines(get_scoreto_path("c3se_20260311.html")))
  expect_true(is_correctly_formatted_courses_table(t))
})

