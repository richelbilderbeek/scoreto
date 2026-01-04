test_that("use", {
  expect_equal(
    extract_english_range(text = "Type:Workshop\n\n\n\nLocation:Zoom (registration required)\n\n\n\n\n\n\n\n\n\n\n\n\n\nDate:27 November 2025\n\n\n\nTime:9-17 each day\n\n\n\n\n\nRegistration"), # nolint
    "27 November 2025"
  )
  expect_equal(
    extract_english_range(text = "Type:Workshop\n\n\n\nLocation:Zoom (registration required)\n\n\n\n\n\n\n\n\n\n\n\n\n\nDate:27 November2025\n\n\n\nTime:9-17 each day\n\n\n\n\n\nRegistration"), # nolint
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

test_that("use", {
  expect_equal(
    extract_english_range(text = "onclick=\"window.location='/support/Events/Berzelius_training_Mar2026/';\"><a href=\"/support/Events/Berzelius_training_Mar2026/\">Berzelius Training - Introduction to Berzelius</a><p>Information about online event March 10, 2026</p></li>"), # nolint
    "March 10, 2026"
  )
})



