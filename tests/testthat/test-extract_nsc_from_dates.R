test_that("use", {
  nsc_courses_text <- get_nsc_test_courses_text()
  from_dates <- extract_nsc_from_dates(nsc_courses_text)
  expect_equal(length(nsc_courses_text), length(from_dates))
})

test_that("example cases", {
  nsc_courses_text <- "onclick=\"window.location='/support/Events/Berzelius_training_Sep2025/';\"><a href=\"/support/Events/Berzelius_training_Sep2025/\">Berzelius Training - Introduction to Berzelius</a><p>Information about online event 9th Sep 2025</p></li>" # nolint
  from_dates <- extract_nsc_from_dates(nsc_courses_text)
  expect_true(!is.na(from_dates))

  nsc_courses_text <- "onclick=\"window.location='/support/Events/Berzelius_training_Oct2025/';\"><a href=\"/support/Events/Berzelius_training_Oct2025/\">Berzelius Training - Practical Machine Learning</a><p>Information about online event Oct. 9th, 2025</p></li>" # nolint
  from_dates <- extract_nsc_from_dates(nsc_courses_text)
  expect_true(!is.na(from_dates))

  nsc_courses_text <- "onclick=\"window.location='/support/Events/NSC_intro_Apr2025/';\"><a href=\"/support/Events/NSC_intro_Apr2025/\">NSC introduction to Tetralith/Sigma - online event</a><p>Information about online event 15th Apr 2025</p></li>" # nolint
  from_dates <- extract_nsc_from_dates(nsc_courses_text)
  expect_true(!is.na(from_dates))

  nsc_courses_text <- "onclick=\"window.location='/support/Events/VASP_seminar_2025/';\"><a href=\"/support/Events/VASP_seminar_2025/\">VASP best practices seminar - online event</a><p>Information about the VASP seminar 3rd Oct 2025</p></li>" # nolint
  from_dates <- extract_nsc_from_dates(nsc_courses_text)
  expect_true(!is.na(from_dates))
})
