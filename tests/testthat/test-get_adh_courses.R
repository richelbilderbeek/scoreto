test_that("use", {
  t <- get_adh_courses()
  expect_true(tibble::is_tibble(t))
  expect_equal(4, length(names(t)))
  expect_equal(c("date", "name", "url", "source"), names(t))
})
