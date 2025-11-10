test_that("use", {
  expect_equal(
    get_naiss_courses_url(),
    "https://www.naiss.se/training/"
  )
})
