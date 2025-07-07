test_that("use", {
  t <- get_sll_courses()
  expect_true(tibble::is_tibble(t))
  expect_equal(5, length(names(t)))
  expect_equal(c("date_from", "date_to", "name", "url", "source"), names(t))
})
