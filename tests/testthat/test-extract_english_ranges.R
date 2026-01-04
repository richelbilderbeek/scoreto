test_that("use", {
  text <- c(
    "Type:Workshop\n\n\n\nLocation:Zoom (registration required)\n\n\n\n\n\n\n\n\n\n\n\n\n\nDate:27 November 2025\n\n\n\nTime:9-17 each day\n\n\n\n\n\nRegistration", # nolint
    "Type:Workshop\n\n\n\nLocation:Zoom (registration required)\n\n\n\n\n\n\n\n\n\n\n\n\n\nDate:27 November2025\n\n\n\nTime:9-17 each day\n\n\n\n\n\nRegistration", # nolint
    "Type:Workshop\n\n\n\nLocation:Zoom (registration required)\n\n\n\n\n\n\n\n\n\n\n\n\n\nDate:27-28 November 2025\n\n\n\nTime:9-17 each day\n\n\n\n\n\nRegistration", # nolint
    "Type:Workshop\n\n\n\nLocation:Zoom (registration required)\n\n\n\n\n\n\n\n\n\n\n\n\n\nDate:27-28 November & 1-2 December 2025\n\n\n\nTime:9-17 each day\n\n\n\n\n\nRegistration", # nolint
    "onclick=\"window.location='/support/Events/Berzelius_training_Mar2026/';\"><a href=\"/support/Events/Berzelius_training_Mar2026/\">Berzelius Training - Introduction to Berzelius</a><p>Information about online event March 10, 2026</p></li>" # nolint
  )
  expect_equal(
    length(extract_english_ranges(text = text)),
    length(text)
  )
})

