#' Extract the from dates from an HPC2N courses text
#' @param hpc2n_courses_text subset of raw HTML from the HPC2N website.
#' @export
extract_hpc2n_from_dates <- function(hpc2n_courses_text) {

  hpc2n_dates <- stringr::str_match(
    hpc2n_courses_text,
    ", ([:digit:].*[reyt]( [:digit:]{4})?),"
  )[, 2]
  testthat::expect_equal(0, sum(is.na(hpc2n_dates)))
  hpc2n_dates

  day <- stringr::str_match(hpc2n_dates, "^[:digit:]+")[, 1]
  day[nchar(day) == 1] <- paste0("0", day[nchar(day) == 1])
  testthat::expect_true(all(2 == nchar(day)))

  month_str <- stringr::str_match(
    hpc2n_dates,
    "[:upper:][:lower:]+"
  )[, 1]
  month <- lubridate::month(lubridate::mdy(paste0(month_str, "/01/2000")))
  month[nchar(month) == 1] <- paste0(
    "0", month[nchar(month) == 1]
  )
  testthat::expect_true(all(2 == nchar(month)))

  year <- stringr::str_match(
    hpc2n_dates,
    "[:digit:]{4}$"
  )[, 1]
  year[is.na(year)] <- lubridate::year(lubridate::today())

  paste0(year, "-", month, "-", day)
}
