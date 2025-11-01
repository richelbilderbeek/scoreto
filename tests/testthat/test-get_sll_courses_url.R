test_that("use", {
  expect_equal(
    get_sll_courses_url(),
    "https://training.scilifelab.se/events"
  )
})
