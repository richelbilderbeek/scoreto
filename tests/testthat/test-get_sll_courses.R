test_that("use", {
  expect_silent(get_sll_courses())

  t <- get_sll_courses()
  expect_true(tibble::is_tibble(t))
  expect_equal(3, length(names(t)))
  expect_equal(c("source", "name", "url"), names(t))
})
