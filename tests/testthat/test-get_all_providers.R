test_that("use", {
  expect_true("AIDA Data Hub" %in% get_all_providers())
  expect_true("ENCCS" %in% get_all_providers())
  expect_true("NAISS" %in% get_all_providers())
  expect_true("PDC" %in% get_all_providers())
  expect_true("SciLifeLab" %in% get_all_providers())
  expect_true("UPPMAX" %in% get_all_providers())

  s <- get_all_providers()
  t <- stringr::str_sort(s)
  expect_equal(s, t)
})
