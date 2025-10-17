#' Extract the from dates from an InfraViz courses text
#' @param infraviz_courses_text subset of raw HTML from the InfraViz website.
#' @export
extract_infraviz_from_dates <- function(infraviz_courses_text) {

  pattern_1 <- paste0(
    "[^[:digit:]]([:digit:]{1,2} (",
    scoreto::get_any_month_regex(), "))"
  )
  pattern_2 <- paste0(
    "((",
    scoreto::get_any_month_regex(),
    ") [:digit:]{1,2})[^[:digit:]] "
  )

  dates_1 <- stringr::str_match(
    infraviz_courses_text,
    pattern_1
  )[, 2]
  dates_2 <- stringr::str_match(
    infraviz_courses_text,
    pattern_2
  )[, 2]
  dates <- dates_1
  dates[is.na(dates)] <- dates_2
  testthat::expect_equal(sum(is.na(dates)), 0)

  day <- stringr::str_match(dates, "([:digit:]+)")[, 2]
  day[nchar(day) == 1] <- paste0("0", day[nchar(day) == 1])
  testthat::expect_true(all(2 == nchar(day)))

  month_str <- stringr::str_match(
    dates,
    "^([:upper:][:lower:]+) "
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
