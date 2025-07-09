test_that("use", {
  t <- get_sll_courses()
  expect_true(tibble::is_tibble(t))
  expect_equal(6, length(names(t)))
  expect_equal(c("date_from", "date_to", "course_name", "course_url", "provider_courses_url", "provider_name"), names(t))
  expect_true(all(stringr::str_detect(t$date_from, "^[:digit:]{4}-[:digit:]{2}-[:digit:]{2}$")))
  expect_true(all(stringr::str_detect(t$date_to, "^[:digit:]{4}-[:digit:]{2}-[:digit:]{2}$")))
})
