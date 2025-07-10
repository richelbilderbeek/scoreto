test_that("use", {
  pdc_courses_text <- c(
    "        <time datetime=\"Aug 14, 2025\" class=\"calendar__date-day\">14</time>", # nolint
    "        <time datetime=\"Sep 29, 2025\" class=\"calendar__date-day\">29</time>"  # nolint
  )
  from_dates <- extract_pdc_from_dates(pdc_courses_text)
  expect_equal(length(from_dates), 2)
})
