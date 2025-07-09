test_that("use", {
  lunarc_courses_text <- get_lunarc_test_courses_text()
  to_dates <- extract_lunarc_to_dates(lunarc_courses_text)
  expect_equal(length(lunarc_courses_text), length(to_dates))
})
