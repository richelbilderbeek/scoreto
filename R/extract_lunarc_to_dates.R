#' Extract the to dates from a LUNARC courses text
#' @param lunarc_courses_text subset of raw HTML from the LUNARC website.
#' @export
extract_lunarc_to_dates <- function(lunarc_courses_text) {

  lunarc_dates <- stringr::str_match(
    lunarc_courses_text,
    ", ([:digit:].*)</a>"
  )[, 2]
  testthat::expect_equal(0, sum(is.na(lunarc_dates)))
  lunarc_dates

  day <- stringr::str_match(lunarc_dates, "([:digit:]+) [:upper:].*")[, 2]
  day[nchar(day) == 1] <- paste0("0", day[nchar(day) == 1])
  testthat::expect_true(all(2 == nchar(day)))

  month_str <- stringr::str_match(
    lunarc_dates,
    "[:upper:][:lower:]+"
  )[, 1]
  month <- lubridate::month(lubridate::mdy(paste0(month_str, "/01/2000")))
  month[nchar(month) == 1] <- paste0(
    "0", month[nchar(month) == 1]
  )
  testthat::expect_true(all(2 == nchar(month)))

  year <- stringr::str_match(
    lunarc_dates,
    "[:digit:]{4}$"
  )[, 1]
  year[is.na(year)] <- lubridate::year(lubridate::today())

  paste0(year, "-", month, "-", day)
}
