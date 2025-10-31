test_that("use", {
  english_from_dates <- c(
    "Nov 3rd, 2025 -",
    "Nov 20th, Dec 4th, 2025",
    "Jan 19th -",
    "Oct 13th -",
    "Oct 6th -",
    "Aug 25th -",
    "Nov 3rd, 2025 -",
    "Mar 03rd -",
    "Jan 20th -",
    "Nov 01st, 2024 -",
    "Oct 21st -",
    "Oct 7th -",
    "May 27th -",
    "Oct 16th -",
    "Oct 23th -",
    "Oct 31st, 2023 -",
    "May 29th -",
    "Mar 01st -",
    "Jan 16th -",
    "Nov 07th -",
    "Nov 01st, 2022 -",
    "Nov 29th -",
    "Oct 4th, 2021",
    "Mar 02nd &"
  )
  for (english_from_date in english_from_dates) {
    from_date <- extract_slubi_from_date(english_from_date)
    expect_equal(
      length(english_from_date), length(from_date)
    )
  }
})
