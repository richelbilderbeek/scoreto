test_that("use", {
  expect_equal(
    extract_english_range(text = "Type:Workshop\n\n\n\nLocation:Zoom (registration required)\n\n\n\n\n\n\n\n\n\n\n\n\n\nDate:27 November 2025\n\n\n\nTime:9-17 each day\n\n\n\n\n\nRegistration"), # nolint
    "27 November 2025"
  )
})

test_that("use", {
  expect_equal(
    extract_english_range(text = "Type:Workshop\n\n\n\nLocation:Zoom (registration required)\n\n\n\n\n\n\n\n\n\n\n\n\n\nDate:27-28 November 2025\n\n\n\nTime:9-17 each day\n\n\n\n\n\nRegistration"), # nolint
    "27-28 November 2025"
  )
})

test_that("use", {
  expect_equal(
    extract_english_range(text = "Type:Workshop\n\n\n\nLocation:Zoom (registration required)\n\n\n\n\n\n\n\n\n\n\n\n\n\nDate:27-28 November & 1-2 December 2025\n\n\n\nTime:9-17 each day\n\n\n\n\n\nRegistration"), # nolint
    "27-28 November & 1-2 December 2025"
  )
})
