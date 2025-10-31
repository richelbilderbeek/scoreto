test_that("use", {

  expect_equal(
    extract_slubi_to_date(english_to_date = "and Feb 16-17th, 2026"),
    "2026-02-17"
  )


  english_to_dates <- c(
    "Jan 18th, 2026", "and Feb 16-17th, 2026", "Jan 30th, 2026",
    "Oct 31st, 2025", "Oct 10th, 2025", "Aug 29th, 2025",
    "Jan 18th, 2026", "Mar 14th, 2025", "Mar 21th, 2025",
    "Jan 31st, 2025", "Jan 19th, 2025", "Oct 25th, 2024",
    "Oct 25th, 2024", "May 31st, 2024", "Dec 8th, 2023",
    "Nov 10th, 2023", "Jan 14th, 2024", "Jun 02nd, 2023",
    "Mar 17th, 2023", "Mar 21st, 2023", "Nov 25th, 2022",
    "Jan 15th, 2023", "Dec 17th, 2021", "Jan 16th, 2022",
    "Mar 03rd, 2020"
  )
  for (english_to_date in english_to_dates) {
    to_date <- extract_slubi_to_date(english_to_date)
    expect_equal(
      length(english_to_date), length(to_date)
    )
  }
})
