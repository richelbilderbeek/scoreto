#' Extract the to date from an CSC date range
#' @param csc_date_range date range as used at the CSC website.
#' @return to date in ISO 8601 format
#' @export
#' @examples
#' extract_csc_to_date("18.-20.11.2025")
#' extract_csc_to_date("25.11.2025")
#' extract_csc_to_date("25.-27.11.2025")
#' extract_csc_to_date("2.-4.12.2025")
extract_csc_to_date <- function(csc_date_range) {
  testthat::expect_equal(1, length(csc_date_range))

  date_range <- stringr::str_replace_all(csc_date_range, ".-", "-")

  testthat::expect_equal(2, stringr::str_count(date_range, "\\."))
  date_elements <- stringr::str_split(date_range, "\\.")[[1]]
  testthat::expect_equal(3, length(date_elements))

  to_day <- date_elements[1]
  if (!stringr::str_detect(date_elements[1], "^[:digit:]+$")) {
    to_day <- stringr::str_match(date_elements[1], "-(.*)")[, 2]
  }
  if (nchar(to_day) == 1) {
    to_day <- paste0("0", to_day)
  }

  month <- date_elements[2]
  if (nchar(month) == 1) {
    month <- paste0("0", month)
  }

  year <- date_elements[3]

  to_date <- paste0(year, "-", month, "-", to_day)
  testthat::expect_true(scoreto::is_correctly_formatted_date(to_date))
  to_date
}
