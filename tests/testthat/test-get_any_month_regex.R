test_that("minimal use", {
  expect_true(nchar(get_any_month_regex()) > 0)
})

test_that("use", {
  expect_true(
    stringr::str_detect(
      string = "It was January 8",
      pattern = get_any_month_regex(),
    )
  )
  expect_true(
    stringr::str_detect(
      string = "It was February 8",
      pattern = get_any_month_regex(),
    )
  )
  expect_true(
    stringr::str_detect(
      string = "It was March 8",
      pattern = get_any_month_regex(),
    )
  )
  expect_true(
    stringr::str_detect(
      string = "It was April 8",
      pattern = get_any_month_regex(),
    )
  )
  expect_true(
    stringr::str_detect(
      string = "It was May 8",
      pattern = get_any_month_regex(),
    )
  )
  expect_true(
    stringr::str_detect(
      string = "It was June 8",
      pattern = get_any_month_regex(),
    )
  )
  expect_true(
    stringr::str_detect(
      string = "It was July 8",
      pattern = get_any_month_regex(),
    )
  )
  expect_true(
    stringr::str_detect(
      string = "It was August 8",
      pattern = get_any_month_regex(),
    )
  )
  expect_true(
    stringr::str_detect(
      string = "It was September 8",
      pattern = get_any_month_regex(),
    )
  )
  expect_true(
    stringr::str_detect(
      string = "It was October 8",
      pattern = get_any_month_regex(),
    )
  )
  expect_true(
    stringr::str_detect(
      string = "It was November 8",
      pattern = get_any_month_regex(),
    )
  )
  expect_true(
    stringr::str_detect(
      string = "It was December 8",
      pattern = get_any_month_regex(),
    )
  )
})
