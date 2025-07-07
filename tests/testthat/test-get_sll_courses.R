test_that("use", {
  expect_silent(get_sll_courses())

  t <- get_sll_courses()
  expect_true(tibble::is_tibble(t))
  expect_equal(2, length(names(t)))
  expect_equal(c("name", "url"), names(t))
})
