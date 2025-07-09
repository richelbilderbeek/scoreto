#' Extract the 'to' date
#' @param sll_date_range a SciLifeLab date range
#' @return a string in `YYYY-MM-DD` format
#' @examples
#' extract_sll_to_date("9 - 11 September 2025") # 2025-09-11
#' extract_sll_to_date("6 - 31 October 2025") # 2025-10-31
#' extract_sll_to_date("24 - 28 November 2025") # 2025-11-28
#' @export
extract_sll_to_date <- function(sll_date_range) {
  year <- stringr::str_match(sll_date_range, "[:digit:]{4}")[, 1]

  month_str <- stringr::str_match(sll_date_range, "[:alpha:]{4,20}")[, 1]

  # Complete to a fake date so lubridate::mdy works
  month <- lubridate::month(lubridate::mdy(paste0(month_str, "/01/2000")))
  month[nchar(month) == 1] <- paste0("0", month[nchar(month) == 1])

  day <- stringr::str_match(sll_date_range, "- ([:digit:]{1,2})")[, 2]
  day[nchar(day) == 1] <- paste0("0", day[nchar(day) == 1])

  testthat::expect_equal(nchar(day), rep(2, length(day)))
  testthat::expect_equal(nchar(month), rep(2, length(day)))
  testthat::expect_equal(nchar(year), rep(4, length(day)))
  testthat::expect_equal(length(year), length(month))
  testthat::expect_equal(length(year), length(day))
  paste0(year, "-", month, "-", day)
}
