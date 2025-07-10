#' Extract the from dates from an PDC courses text
#' @param pdc_courses_text subset of raw HTML from the PDC website.
#' @export
extract_pdc_from_dates <- function(pdc_courses_text) {

  dates <- stringr::str_match(
    pdc_courses_text,
    "datetime=\"(.*)\" class"
  )[, 2]

  day <- stringr::str_match(dates, "[:lower:] ([:digit:]+)")[, 2]
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
