#' Convert an ECSS data to `YYYY-MM-DD` format
#' @param enccs_dates a date in ENCCS formal
#' @return a string in `YYYY-MM-DD` format
#' @examples
#' convert_enccs_dates("Jul 10") # 2025-07-10
#' @export
convert_enccs_dates <- function(enccs_dates) {
  month_str <- stringr::str_match(enccs_dates, "^([:upper:][:lower:]{2})")[, 2]
  month <- lubridate::month(lubridate::mdy(paste0(month_str, "/01/2000")))
  month[nchar(month) == 1] <- paste0("0", month[nchar(month) == 1])

  day <- stringr::str_match(enccs_dates, "([:digit:]{1,2})")[, 2]
  day[nchar(day) == 1] <- paste0("0", day[nchar(day) == 1])

  year <- rep(lubridate::year(lubridate::today()), length(enccs_dates))

  testthat::expect_equal(nchar(day), rep(2, length(day)))
  testthat::expect_equal(nchar(month), rep(2, length(day)))
  testthat::expect_equal(nchar(year), rep(4, length(day)))
  testthat::expect_equal(length(year), length(month))
  testthat::expect_equal(length(year), length(day))
  paste0(year, "-", month, "-", day)
}
