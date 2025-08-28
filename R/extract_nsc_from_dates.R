#' Extract the from dates from an NSC courses text
#' @param nsc_courses_text subset of raw HTML from the NSC website.
#' @export
extract_nsc_from_dates <- function(nsc_courses_text) {

  dates_1 <- stringr::str_match(
    nsc_courses_text,
    "[:digit:]+(th|rd) [:upper:][:lower:]+.*[:digit:]{4}"
  )[, 1]
  dates_2 <- stringr::str_match(
    nsc_courses_text,
    "[:upper:][:lower:]+\\.? [:digit:]+(th|rd),? [:digit:]{4}"
  )[, 1]
  dates <- dates_1
  na_indices <- which(is.na(dates))
  dates[na_indices] <- dates_2[na_indices]
  testthat::expect_equal(0, sum(is.na(dates)))


  day <- stringr::str_match(dates, "([:digit:]+)(th|rd)")[, 2]
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
