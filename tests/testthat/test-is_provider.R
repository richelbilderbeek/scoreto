test_that("use", {
  expect_true(is_provider("AIDA Data Hub"))
  expect_true(is_provider("NAISS"))
  expect_true(is_provider("PDC"))
  expect_true(is_provider("SciLifeLab"))
  expect_true(is_provider("UPPMAX"))
  expect_false(is_provider("McDonalds"))
})
