test_that("minimal use", {
  expect_silent(get_other_to_center())
})

test_that("all centers are providers", {
  t <- get_other_to_center()
  expect_true(all(t$center %in% get_all_providers()))
})
