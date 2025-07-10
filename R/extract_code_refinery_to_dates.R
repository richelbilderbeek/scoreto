#' Extract the to dates from an Code Refinery courses text
#' @param code_refinery_courses_text subset of raw HTML from the Code Refinery website.
#' @export
extract_code_refinery_to_dates <- function(code_refinery_courses_text) {

  dates <- stringr::str_match(
    code_refinery_courses_text,
    "- ([:upper:][:lower:]+ [0-9-]+ [:digit:]{4}) "
  )[, 2]

  day <- stringr::str_match(dates, "([:digit:]+) 20")[, 2]
  day[nchar(day) == 1] <- paste0("0", day[nchar(day) == 1])
  testthat::expect_true(all(2 == nchar(day)))

  month_str <- stringr::str_match(
    dates,
    "[:upper:][:lower:]+"
  )[, 1]
  month <- lubridate::month(lubridate::mdy(paste0(month_str, "/01/2000")))
  month[nchar(month) == 1] <- paste0(
    "0", month[nchar(month) == 1]
  )
  testthat::expect_true(all(2 == nchar(month)))

  year <- stringr::str_match(
    dates,
    "[:digit:]{4}$"
  )[, 1]
  year[is.na(year)] <- lubridate::year(lubridate::today())

  paste0(year, "-", month, "-", day)
}
