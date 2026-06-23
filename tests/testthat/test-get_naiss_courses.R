test_that("use on today's data", {
  t <- get_naiss_courses()
  expect_true(is_correctly_formatted_courses_table(t))
})

test_that("use on testing data, 2026-06-23", {
  t <- get_naiss_courses(html_text = get_scoreto_path("naiss_20260623.html"))
  expect_true(is_correctly_formatted_courses_table(t))
})
