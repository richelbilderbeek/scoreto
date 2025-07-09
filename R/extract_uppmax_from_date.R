#' Extract the 'from' date
#' @param uppmax_date_range a SciLifeLab date range
#' @return a string in `YYYY-MM-DD` format
#' @examples
#' extract_uppmax_from_date("Aug 25-27") # 2025-08-25
#' extract_uppmax_from_date("Oct 14") # 2025-10-14
#' extract_uppmax_from_date("Oct 23-24 + 27-29") # 2025-10-23
#' @export
extract_uppmax_from_date <- function(uppmax_date_range) {
  testthat::expect_equal(
    1,
    length(uppmax_date_range),
    info = "Use 'extract_uppmax_from_dates' if you need more elements"
  )

  # uppmax_date_range <- "Oct 23-24 + 27-29"
  year <- lubridate::year(lubridate::today())

  month_str <- stringr::str_match(uppmax_date_range, "[:upper:][:alpha:]{2,10}")[, 1]

  # Complete to a fake date so lubridate::mdy works
  month <- lubridate::month(lubridate::mdy(paste0(month_str, "/01/2000")))
  month[nchar(month) == 1] <- paste0("0", month[nchar(month) == 1])

  day <- stringr::str_match(uppmax_date_range, " ([:digit:]{1,2})")[, 2]
  day[nchar(day) == 1] <- paste0("0", day[nchar(day) == 1])

  testthat::expect_equal(nchar(day), rep(2, length(day)))
  testthat::expect_equal(nchar(month), rep(2, length(day)))
  testthat::expect_equal(nchar(year), rep(4, length(day)))
  testthat::expect_equal(length(year), length(month))
  testthat::expect_equal(length(year), length(day))
  paste0(year, "-", month, "-", day)
}
