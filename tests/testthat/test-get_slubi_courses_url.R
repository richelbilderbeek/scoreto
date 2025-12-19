test_that("use", {
  expect_equal(
    get_slubi_courses_url(),
    get_provider_courses_url("SLUBI")
  )
})
