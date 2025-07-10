#' Extract the to dates from an CSC courses text
#' @param csc_courses_text subset of raw HTML from the CSC website.
#' @export
extract_csc_to_dates <- function(csc_courses_text) {

  raw_dates_text <- stringr::str_subset(
    csc_courses_text,
    "[[:digit:]\\.-]+\\.20[:digit:]{2}$"
  )
  dates <- stringr::str_match(
    raw_dates_text,
    "([[:digit:]\\.-]+\\.20[:digit:]{2})$"
  )[, 2]

  day <- stringr::str_match(dates, "([:digit:]+)\\.[:digit:]{1,2}\\.20")[, 2]
  day[nchar(day) == 1] <- paste0("0", day[nchar(day) == 1])
  testthat::expect_true(all(2 == nchar(day)))

  month_str <- stringr::str_match(
    dates,
    "\\.([:digit:]{1,2})\\.2"
  )[, 2]
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
