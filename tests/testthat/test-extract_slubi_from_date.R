test_that("use", {
  expect_equal(
    extract_slubi_from_date(english_from_date = "Nov 3rd, 2025 -"),
    "2025-11-03"
  )
  expect_equal(
    extract_slubi_from_date(english_from_date = "Nov 20th, Dec 4th, 2025"),
    "2025-11-20"
  )
  expect_equal(
    extract_slubi_from_date(english_from_date = "Jan 19th -"),
    paste0(lubridate::year(lubridate::today()), "-01-19")
  )
  expect_equal(
    extract_slubi_from_date("Oct 13th -"),
    paste0(lubridate::year(lubridate::today()), "-10-13")
  )
  expect_equal(
    extract_slubi_from_date("Oct 6th -"),
    paste0(lubridate::year(lubridate::today()), "-10-06")
  )
  expect_equal(
    extract_slubi_from_date("Aug 25th -"),
    paste0(lubridate::year(lubridate::today()), "-08-25")
  )
  expect_equal(
    extract_slubi_from_date("Nov 3rd, 2025 -"),
    "2025-11-03"
  )
  expect_equal(
    extract_slubi_from_date("Mar 03rd -"),
    paste0(lubridate::year(lubridate::today()), "-03-03")
  )
  expect_equal(
    extract_slubi_from_date("Jan 20th -"),
    paste0(lubridate::year(lubridate::today()), "-01-20")
  )
  expect_equal(
    extract_slubi_from_date(english_from_date = "Nov 01st, 2024 -"),
    "2024-11-01"
  )
  expect_equal(
    extract_slubi_from_date("Oct 21st -"),
    paste0(lubridate::year(lubridate::today()), "-10-21")
  )
  expect_equal(
    extract_slubi_from_date("Oct 7th -"),
    paste0(lubridate::year(lubridate::today()), "-10-07")
  )
  expect_equal(
    extract_slubi_from_date("May 27th -"),
    paste0(lubridate::year(lubridate::today()), "-05-27")
  )
  expect_equal(
    extract_slubi_from_date("Oct 16th -"),
    paste0(lubridate::year(lubridate::today()), "-10-16")
  )
  expect_equal(
    extract_slubi_from_date("Oct 23th -"),
    paste0(lubridate::year(lubridate::today()), "-10-23")
  )

  expect_equal(
    extract_slubi_from_date("Oct 31st, 2023 -"),
    "2023-10-31"
  )
  expect_equal(
    extract_slubi_from_date("May 29th -"),
    paste0(lubridate::year(lubridate::today()), "-05-29")
  )
  expect_equal(
    extract_slubi_from_date("Mar 01st -"),
    paste0(lubridate::year(lubridate::today()), "-03-01")
  )
  expect_equal(
    extract_slubi_from_date("Jan 16th -"),
    paste0(lubridate::year(lubridate::today()), "-01-16")
  )
  expect_equal(
    extract_slubi_from_date("Nov 07th -"),
    paste0(lubridate::year(lubridate::today()), "-11-07")
  )
  expect_equal(
    extract_slubi_from_date("Nov 01st, 2022 -"),
    "2022-11-01"
  )
  expect_equal(
    extract_slubi_from_date("Nov 29th -"),
    paste0(lubridate::year(lubridate::today()), "-11-29")
  )
  expect_equal(
    extract_slubi_from_date("Oct 4th, 2021"),
    "2021-10-04"
  )
  expect_equal(
    extract_slubi_from_date(english_from_date = "Mar 02nd &"),
    paste0(lubridate::year(lubridate::today()), "-03-02")
  )
})
