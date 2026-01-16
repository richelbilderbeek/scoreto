test_that("use", {
  expect_equal(
    extract_english_range(text = "Type:Workshop\n\n\n\nLocation:Zoom (registration required)\n\n\n\n\n\n\n\n\n\n\n\n\n\nDate:27 November 2025\n\n\n\nTime:9-17 each day\n\n\n\n\n\nRegistration"), # nolint
    "27 November 2025"
  )
  expect_equal(
    extract_english_range(text = "Type:Workshop\n\n\n\nLocation:Zoom (registration required)\n\n\n\n\n\n\n\n\n\n\n\n\n\nDate:27 November2025\n\n\n\nTime:9-17 each day\n\n\n\n\n\nRegistration"), # nolint
    "27 November 2025"
  )
  expect_equal(
    extract_english_range(text = "Type:Workshop\n\n\n\nLocation:Zoom (registration required)\n\n\n\n\n\n\n\n\n\n\n\n\n\nDate:27-28 November 2025\n\n\n\nTime:9-17 each day\n\n\n\n\n\nRegistration"), # nolint
    "27-28 November 2025"
  )
  expect_equal(
    extract_english_range(text = "Type:Workshop\n\n\n\nLocation:Zoom (registration required)\n\n\n\n\n\n\n\n\n\n\n\n\n\nDate:27-28 November & 1-2 December 2025\n\n\n\nTime:9-17 each day\n\n\n\n\n\nRegistration"), # nolint
    "27-28 November & 1-2 December 2025"
  )
  expect_equal(
    extract_english_range(text = "onclick=\"window.location='/support/Events/Berzelius_training_Mar2026/';\"><a href=\"/support/Events/Berzelius_training_Mar2026/\">Berzelius Training - Introduction to Berzelius</a><p>Information about online event March 10, 2026</p></li>"), # nolint
    "March 10, 2026"
  )

  expect_equal(
    extract_english_range(text = "onclick=\"window.location='/support/Events/Berzelius_training_Sep2025/';\"><a href=\"/support/Events/Berzelius_training_Sep2025/\">Berzelius Training - Introduction to Berzelius</a><p>Information about online event 9th Sep 2025</p></li>"), # nolint
    "9th Sep 2025"
  )
  expect_equal(
    extract_english_range(text = "onclick=\"window.location='/support/Events/Berzelius_training_Oct2025/';\"><a href=\"/support/Events/Berzelius_training_Oct2025/\">Berzelius Training - Practical Machine Learning</a><p>Information about online event Oct. 9th, 2025</p></li>"), # nolint
    "Oct. 9th, 2025"
  )
  expect_equal(
    extract_english_range(text = "onclick=\"window.location='/support/Events/NSC_intro_Apr2025/';\"><a href=\"/support/Events/NSC_intro_Apr2025/\">NSC introduction to Tetralith/Sigma - online event</a><p>Information about online event 15th Apr 2025</p></li>"), # nolint
    "15th Apr 2025"
  )
  expect_equal(
    extract_english_range(text = "onclick=\"window.location='/support/Events/VASP_seminar_2025/';\"><a href=\"/support/Events/VASP_seminar_2025/\">VASP best practices seminar - online event</a><p>Information about the VASP seminar 3rd Oct 2025</p></li>"), # nolint
    "3rd Oct 2025"
  )
})

