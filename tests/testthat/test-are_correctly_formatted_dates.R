test_that("use", {
  expect_true(
    are_correctly_formatted_dates(
      date_strs = c("1234-11-11", "1234-11-12")
    )
  )
})
