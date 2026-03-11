test_that("use on today's data", {
  t <- get_enccs_courses()
  expect_true(is_correctly_formatted_courses_table(t))
})

test_that("use on testing data", {
  t <- get_enccs_courses(html_text = get_test_enccs_html())
  expect_true(is_correctly_formatted_courses_table(t))
})

test_that("use on testing data, 2026-03-11", {
  t <- get_enccs_courses(html_text = get_scoreto_path("enccs_20260311.html"))
  expect_true(is_correctly_formatted_courses_table(t))
})
