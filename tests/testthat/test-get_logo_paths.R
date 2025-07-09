test_that("use", {
  expect_equal(
    length(get_logo_paths(provider_names = c("AIDA Data Hub", "NAISS"))),
    2
  )
})
