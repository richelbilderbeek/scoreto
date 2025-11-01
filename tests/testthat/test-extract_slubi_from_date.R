test_that("use", {
  expect_equal(
    extract_slubi_from_date(
      english_date_range = "Nov 3rd, 2025 - Jan 18th, 2026"
    ),
    "2025-11-03"
  )
})
