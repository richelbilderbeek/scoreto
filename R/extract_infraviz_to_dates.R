#' Extract the to dates from an InfraViz courses text
#' @param infraviz_courses_text subset of raw HTML from the InfraViz website.
#' @export
extract_infraviz_to_dates <- function(infraviz_courses_text) {

  dates <- stringr::str_match(
    infraviz_courses_text,
    "Time: (.*); Location"
  )[, 2]

  day <- stringr::str_match(dates, "([:digit:]+), ")[, 2]
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
