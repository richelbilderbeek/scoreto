test_that("use", {
  english_date_ranges <- c(
    "Nov 3rd, 2025 - Jan 18th, 2026",
    "Nov 20th, Dec 4th, 2025 and Feb 16-17th, 2026",
    "Jan 19th - Jan 30th, 2026",
    "Oct 13th - Oct 31st, 2025",
    "Oct 6th - Oct 10th, 2025",
    "Aug 25th - Aug 29th, 2025",
    "Nov 3rd, 2025 - Jan 18th, 2026",
    "Mar 03rd - Mar 14th, 2025",
    "Jan 20th - Mar 21th, 2025",
    "Jan 20th - Jan 31st, 2025",
    "Nov 01st, 2024 - Jan 19th, 2025",
    "Oct 21st - Oct 25th, 2024",
    "Oct 7th - Oct 25th, 2024",
    "May 27th - May 31st, 2024",
    "Oct 16th - Dec 8th, 2023",
    "Oct 23th - Nov 10th, 2023",
    "Oct 31st, 2023 - Jan 14th, 2024",
    "May 29th - Jun 02nd, 2023",
    "Mar 01st - Mar 17th, 2023",
    "Jan 16th - Mar 21st, 2023",
    "Nov 07th - Nov 25th, 2022",
    "Nov 01st, 2022 - Jan 15th, 2023",
    "Nov 29th - Dec 17th, 2021",
    "Oct 4th, 2021 Jan 16th, 2022",
    "Mar 02nd & Mar 03rd, 2020",
    "3 - 14 November 2025",
    "10 - 14 November 2025",
    "11 - 14 November 2025",
    "17 - 21 November 2025",
    "24 - 28 November 2025",
    "1 - 5 December 2025",
    "8 - 12 December 2025",
    "31 December 2025",
    "31 December 2025",
    "11 - 16 March 2026"
  )
  to_dates <- extract_english_to_dates(english_date_ranges)
  expect_equal(length(english_date_ranges), length(to_dates))
  expect_false(all(stringr::str_detect(to_dates, "NA")))
})
