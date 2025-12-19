test_that("use", {
  expect_equal(
    get_sll_courses_url(),
    get_provider_courses_url("SciLifeLab")

  )
})
