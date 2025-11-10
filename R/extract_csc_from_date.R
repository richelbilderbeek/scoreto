#' Extract the from date from an CSC date range
#' @param csc_date_range date range as used at the CSC website.
#' @return from date in ISO 8601 format
#' @export
#' @examples
#' extract_csc_from_date("18.-20.11.2025")
#' extract_csc_from_date("25.11.2025")
#' extract_csc_from_date("25.-27.11.2025")
#' extract_csc_from_date("2.-4.12.2025")
extract_csc_from_date <- function(csc_date_range) {
  testthat::expect_equal(1, length(csc_date_range))

  date_range <- stringr::str_replace_all(csc_date_range, ".-", "-")

  testthat::expect_equal(2, stringr::str_count(date_range, "\\."))
  date_elements <- stringr::str_split(date_range, "\\.")[[1]]
  testthat::expect_equal(3, length(date_elements))

  from_day <- date_elements[1]
  if (!stringr::str_detect(date_elements[1], "^[:digit:]+$")) {
    from_day <- stringr::str_match(date_elements[1], "(.*)-")[, 2]
  }
  if (nchar(from_day) == 1) {
    from_day <- paste0("0", from_day)
  }

  month <- date_elements[2]
  year <- date_elements[3]

  from_date <- paste0(year, "-", month, "-", from_day)
  testthat::expect_true(scoreto::is_correctly_formatted_date(from_date))
  from_date
}
