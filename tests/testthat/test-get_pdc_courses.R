test_that("minimal use", {
  t <- get_pdc_courses()
  expect_true(is_correctly_formatted_courses_table(t))
})

test_that("use correct URLs", {
  t <- get_pdc_courses()
  expect_equal(
    0,
    sum(stringr::str_detect(t$course_url, "about/events/about/events"))
  )
})
